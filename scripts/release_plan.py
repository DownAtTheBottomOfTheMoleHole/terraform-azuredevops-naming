#!/usr/bin/env python3
"""Build a deterministic, immutable release plan for the main branch.

The planner intentionally has no write operations. It inspects the first-parent
history, GitHub pull requests, tags, and the latest release so the workflow can
validate every selected commit before it creates any refs or releases.
"""

from __future__ import annotations

import argparse
import json
import os
import re
import subprocess
import sys
import time
from dataclasses import dataclass
from typing import Any, Iterable, Mapping, Sequence


STABLE_TAG_PATTERN = re.compile(
    r"^v(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)$"
)
MAJOR_LABEL = "module-release:major"
MINOR_LABEL = "module-release:minor"


class PlanError(RuntimeError):
    """Raised when repository state cannot produce one safe release plan."""


@dataclass(frozen=True)
class StableTag:
    """A strict stable tag and the commit it identifies."""

    name: str
    version: tuple[int, int, int]
    sha: str


def parse_stable_tag(tag: str) -> tuple[int, int, int] | None:
    """Parse an exact vMAJOR.MINOR.PATCH tag, rejecting loose SemVer forms."""

    match = STABLE_TAG_PATTERN.fullmatch(tag)
    if match is None:
        return None
    return tuple(int(part) for part in match.groups())  # type: ignore[return-value]


def bump_version(
    version: tuple[int, int, int], labels: Iterable[str]
) -> tuple[tuple[int, int, int], str]:
    """Return the next version and bump kind selected by dedicated labels."""

    normalized = {label.casefold() for label in labels}
    wants_major = MAJOR_LABEL in normalized
    wants_minor = MINOR_LABEL in normalized

    if wants_major and wants_minor:
        raise PlanError(
            f"a pull request cannot have both {MAJOR_LABEL!r} and {MINOR_LABEL!r}"
        )

    major, minor, patch = version
    if wants_major:
        return (major + 1, 0, 0), "major"
    if wants_minor:
        return (major, minor + 1, 0), "minor"
    return (major, minor, patch + 1), "patch"


def format_tag(version: tuple[int, int, int]) -> str:
    """Format a stable version as a canonical Git tag."""

    return f"v{version[0]}.{version[1]}.{version[2]}"


def canonical_json(value: Mapping[str, Any]) -> str:
    """Serialize a plan in the single canonical form compared by the workflow."""

    return json.dumps(value, sort_keys=True, separators=(",", ":"))


def matching_pull_requests(sha: str, pull_requests: Iterable[Mapping[str, Any]]) -> list[Mapping[str, Any]]:
    """Select merged-main PRs whose recorded merge commit is exactly ``sha``."""

    return [
        pull_request
        for pull_request in pull_requests
        if pull_request.get("merged_at") is not None
        and pull_request.get("merge_commit_sha") == sha
        and isinstance(pull_request.get("base"), Mapping)
        and pull_request["base"].get("ref") == "main"
    ]


def build_new_release_items(
    commits: Sequence[str],
    starting_version: tuple[int, int, int],
    previous_tag: str | None,
    pull_requests_by_sha: Mapping[str, Sequence[Mapping[str, Any]]],
    existing_tag_targets: Mapping[str, str],
) -> list[dict[str, Any]]:
    """Build sequential release items from oldest to newest first-parent commit."""

    version = starting_version
    items: list[dict[str, Any]] = []

    for sha in commits:
        matches = matching_pull_requests(sha, pull_requests_by_sha.get(sha, ()))
        if len(matches) != 1:
            raise PlanError(
                f"commit {sha} must map to exactly one merged pull request based on main; "
                f"found {len(matches)} (direct pushes and ambiguous provenance are not releasable)"
            )

        pull_request = matches[0]
        labels = [
            label["name"]
            for label in pull_request.get("labels", [])
            if isinstance(label, Mapping) and isinstance(label.get("name"), str)
        ]
        version, bump = bump_version(version, labels)
        tag = format_tag(version)

        if tag in existing_tag_targets:
            raise PlanError(
                f"planned tag {tag} already identifies {existing_tag_targets[tag]}; "
                "tags are immutable and will not be moved"
            )

        number = pull_request.get("number")
        if not isinstance(number, int):
            raise PlanError(f"the pull request for commit {sha} has no numeric number")

        items.append(
            {
                "bump": bump,
                "kind": "create",
                "previous_tag": previous_tag,
                "pr_number": number,
                "sha": sha,
                "tag": tag,
            }
        )
        previous_tag = tag

    return items


class CommandRunner:
    """Small subprocess boundary kept separate from the pure planning helpers."""

    @staticmethod
    def run(arguments: Sequence[str], *, check: bool = True) -> subprocess.CompletedProcess[str]:
        try:
            return subprocess.run(
                list(arguments),
                check=check,
                capture_output=True,
                text=True,
            )
        except FileNotFoundError as error:
            raise PlanError(f"required command is unavailable: {arguments[0]}") from error
        except subprocess.CalledProcessError as error:
            details = (error.stderr or error.stdout or "").strip()
            raise PlanError(f"command failed: {' '.join(arguments)}: {details}") from error


def command_output(runner: CommandRunner, *arguments: str) -> str:
    """Run a command and return stdout without trailing whitespace."""

    return runner.run(arguments).stdout.strip()


def resolve_commit(runner: CommandRunner, revision: str) -> str:
    """Resolve a revision to one commit SHA."""

    return command_output(runner, "git", "rev-parse", "--verify", f"{revision}^{{commit}}")


def first_parent_history(runner: CommandRunner, revision: str) -> list[str]:
    """Return first-parent commits newest first."""

    output = command_output(runner, "git", "rev-list", "--first-parent", revision)
    return output.splitlines() if output else []


def stable_tags(
    runner: CommandRunner, first_parent_commits: Sequence[str]
) -> tuple[list[StableTag], dict[str, str]]:
    """Return strict tags on the first-parent chain and all strict tag targets."""

    tags = command_output(runner, "git", "tag", "--list").splitlines()
    positions = {sha: index for index, sha in enumerate(first_parent_commits)}
    reachable: list[StableTag] = []
    all_targets: dict[str, str] = {}

    for tag in tags:
        version = parse_stable_tag(tag)
        if version is None:
            continue
        sha = resolve_commit(runner, tag)
        all_targets[tag] = sha
        if sha in positions:
            reachable.append(StableTag(name=tag, version=version, sha=sha))

    # Older repository history can contain multiple stable tags on one commit.
    # Preserve the highest version at each point so those aliases do not prevent
    # future releases, while retaining every name in all_targets for collision
    # checks.
    tags_by_commit: dict[str, list[StableTag]] = {}
    for record in reachable:
        tags_by_commit.setdefault(record.sha, []).append(record)
    reachable = [
        max(records, key=lambda record: record.version)
        for records in tags_by_commit.values()
    ]
    reachable.sort(key=lambda record: positions[record.sha], reverse=True)

    if reachable:
        highest = max(reachable, key=lambda record: record.version)
        newest = reachable[-1]
        if highest != newest:
            raise PlanError(
                f"stable tag history is not monotonic: newest tag {newest.name} follows "
                f"higher version {highest.name}"
            )

    return reachable, all_targets


def pull_requests_for_commit(
    runner: CommandRunner, repository: str, sha: str
) -> list[Mapping[str, Any]]:
    """Read PR associations, tolerating GitHub's short post-merge indexing lag."""

    retry_delays = (1, 2, 4, 8, 16)
    value: list[Mapping[str, Any]] = []

    for attempt in range(len(retry_delays) + 1):
        output = command_output(
            runner,
            "gh",
            "api",
            "--method",
            "GET",
            f"repos/{repository}/commits/{sha}/pulls",
            "-f",
            "per_page=100",
        )
        try:
            decoded = json.loads(output)
        except json.JSONDecodeError as error:
            raise PlanError(f"GitHub returned invalid PR JSON for commit {sha}") from error
        if not isinstance(decoded, list):
            raise PlanError(f"GitHub returned an unexpected PR response for commit {sha}")
        value = decoded

        # Return immediately for either an exact match or an ambiguity that the
        # caller must reject. Retry only the eventual-consistency zero-match case.
        if matching_pull_requests(sha, value):
            return value
        if attempt == len(retry_delays):
            break

        delay = retry_delays[attempt]
        print(
            f"no exact merged-PR association for {sha}; retrying in {delay}s",
            file=sys.stderr,
        )
        time.sleep(delay)

    return value


def release_exists(runner: CommandRunner, repository: str, tag: str) -> bool:
    """Return whether GitHub has a release for a tag; fail on non-404 errors."""

    result = runner.run(
        ("gh", "api", f"repos/{repository}/releases/tags/{tag}"), check=False
    )
    if result.returncode == 0:
        try:
            release = json.loads(result.stdout)
        except json.JSONDecodeError as error:
            raise PlanError(f"GitHub returned invalid release JSON for {tag}") from error
        if not isinstance(release, Mapping) or release.get("tag_name") != tag:
            raise PlanError(f"GitHub returned an unexpected release response for {tag}")
        if release.get("draft") is True or release.get("prerelease") is True:
            raise PlanError(f"release {tag} exists but is not a published stable release")
        return True

    details = f"{result.stdout}\n{result.stderr}"
    if "HTTP 404" in details or "Not Found" in details:
        return False
    raise PlanError(f"could not inspect GitHub release {tag}: {details.strip()}")


def build_plan(
    runner: CommandRunner, *, target_revision: str, main_revision: str, repository: str
) -> dict[str, Any]:
    """Build a complete read-only release plan for one target revision."""

    target_sha = resolve_commit(runner, target_revision)
    main_sha = resolve_commit(runner, main_revision)
    main_history = first_parent_history(runner, main_sha)

    if target_sha != main_sha:
        if target_sha in main_history:
            return {
                "base_tag": None,
                "items": [],
                "main_sha": main_sha,
                "schema_version": 1,
                "stale_target": True,
                "target_sha": target_sha,
            }
        raise PlanError(
            f"target {target_sha} is not the current main commit or a first-parent ancestor of it"
        )

    target_history = first_parent_history(runner, target_sha)
    reachable_tags, all_tag_targets = stable_tags(runner, target_history)
    latest_tag = reachable_tags[-1] if reachable_tags else None
    items: list[dict[str, Any]] = []

    if latest_tag is not None and not release_exists(runner, repository, latest_tag.name):
        previous_stable_tag = reachable_tags[-2].name if len(reachable_tags) > 1 else None
        items.append(
            {
                "bump": None,
                "kind": "repair-release",
                "previous_tag": previous_stable_tag,
                "pr_number": None,
                "sha": latest_tag.sha,
                "tag": latest_tag.name,
            }
        )

    if latest_tag is None:
        unreleased_commits = list(reversed(target_history))
        starting_version = (0, 0, 0)
        previous_tag = None
    else:
        latest_index = target_history.index(latest_tag.sha)
        unreleased_commits = list(reversed(target_history[:latest_index]))
        starting_version = latest_tag.version
        previous_tag = latest_tag.name

    pull_requests_by_sha = {
        sha: pull_requests_for_commit(runner, repository, sha)
        for sha in unreleased_commits
    }
    items.extend(
        build_new_release_items(
            unreleased_commits,
            starting_version,
            previous_tag,
            pull_requests_by_sha,
            all_tag_targets,
        )
    )

    return {
        "base_tag": latest_tag.name if latest_tag is not None else None,
        "items": items,
        "main_sha": main_sha,
        "schema_version": 1,
        "stale_target": False,
        "target_sha": target_sha,
    }


def parse_arguments(arguments: Sequence[str]) -> argparse.Namespace:
    """Parse command-line arguments."""

    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--target", required=True, help="commit or ref proposed for release")
    parser.add_argument(
        "--main",
        default="refs/remotes/origin/main",
        help="freshly fetched main ref used to reject stale targets",
    )
    parser.add_argument(
        "--repository",
        default=os.environ.get("GITHUB_REPOSITORY"),
        help="GitHub OWNER/REPOSITORY (defaults to GITHUB_REPOSITORY)",
    )
    parsed = parser.parse_args(arguments)
    if not parsed.repository:
        parser.error("--repository or GITHUB_REPOSITORY is required")
    return parsed


def main(arguments: Sequence[str] | None = None) -> int:
    """CLI entry point."""

    options = parse_arguments(sys.argv[1:] if arguments is None else arguments)
    try:
        plan = build_plan(
            CommandRunner(),
            target_revision=options.target,
            main_revision=options.main,
            repository=options.repository,
        )
    except PlanError as error:
        print(f"release planning failed: {error}", file=sys.stderr)
        return 1

    print(canonical_json(plan))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
