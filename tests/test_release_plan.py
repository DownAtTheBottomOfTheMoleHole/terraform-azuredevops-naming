"""Unit tests for the deterministic release planner."""

from __future__ import annotations

import importlib.util
import json
import pathlib
import subprocess
import sys
import unittest
from unittest import mock


SCRIPT_PATH = pathlib.Path(__file__).parents[1] / "scripts" / "release_plan.py"
SPEC = importlib.util.spec_from_file_location("release_plan", SCRIPT_PATH)
assert SPEC is not None and SPEC.loader is not None
release_plan = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = release_plan
SPEC.loader.exec_module(release_plan)


def merged_pull_request(number: int, sha: str, *labels: str) -> dict[str, object]:
    """Return the subset of a GitHub PR response used by the planner."""

    return {
        "base": {"ref": "main"},
        "labels": [{"name": label} for label in labels],
        "merge_commit_sha": sha,
        "merged_at": "2026-09-20T12:00:00Z",
        "number": number,
    }


class StableTagTests(unittest.TestCase):
    def test_accepts_only_strict_stable_tags(self) -> None:
        self.assertEqual((1, 2, 3), release_plan.parse_stable_tag("v1.2.3"))
        self.assertEqual((0, 0, 0), release_plan.parse_stable_tag("v0.0.0"))

        for invalid in (
            "1.2.3",
            "V1.2.3",
            "v01.2.3",
            "v1.02.3",
            "v1.2.03",
            "v1.2",
            "v1.2.3-rc.1",
            "v1.2.3+build",
            "v1.2.3\n",
        ):
            with self.subTest(tag=invalid):
                self.assertIsNone(release_plan.parse_stable_tag(invalid))


class VersionBumpTests(unittest.TestCase):
    def test_patch_is_the_default(self) -> None:
        self.assertEqual(((4, 2, 1), "patch"), release_plan.bump_version((4, 2, 0), []))

    def test_minor_resets_patch(self) -> None:
        self.assertEqual(
            ((4, 3, 0), "minor"),
            release_plan.bump_version((4, 2, 9), ["module-release:minor"]),
        )

    def test_major_resets_minor_and_patch(self) -> None:
        self.assertEqual(
            ((5, 0, 0), "major"),
            release_plan.bump_version((4, 2, 9), ["MODULE-RELEASE:MAJOR"]),
        )

    def test_conflicting_labels_fail_closed(self) -> None:
        with self.assertRaisesRegex(release_plan.PlanError, "cannot have both"):
            release_plan.bump_version(
                (1, 2, 3),
                ["module-release:major", "module-release:minor"],
            )


class SequentialPlanTests(unittest.TestCase):
    def test_builds_one_version_per_merge_oldest_first(self) -> None:
        commits = ["a" * 40, "b" * 40, "c" * 40]
        pull_requests = {
            commits[0]: [merged_pull_request(101, commits[0], "module-release:minor")],
            commits[1]: [merged_pull_request(102, commits[1])],
            commits[2]: [merged_pull_request(103, commits[2], "module-release:major")],
        }

        items = release_plan.build_new_release_items(
            commits,
            (2, 4, 7),
            "v2.4.7",
            pull_requests,
            {},
        )

        self.assertEqual(["v2.5.0", "v2.5.1", "v3.0.0"], [item["tag"] for item in items])
        self.assertEqual(
            ["v2.4.7", "v2.5.0", "v2.5.1"],
            [item["previous_tag"] for item in items],
        )
        self.assertEqual([101, 102, 103], [item["pr_number"] for item in items])

    def test_rejects_a_commit_without_exactly_one_matching_pr(self) -> None:
        sha = "d" * 40
        with self.assertRaisesRegex(release_plan.PlanError, "exactly one"):
            release_plan.build_new_release_items([sha], (1, 0, 0), "v1.0.0", {}, {})

    def test_rejects_an_existing_planned_tag(self) -> None:
        sha = "e" * 40
        pull_requests = {sha: [merged_pull_request(104, sha)]}
        with self.assertRaisesRegex(release_plan.PlanError, "immutable"):
            release_plan.build_new_release_items(
                [sha],
                (1, 0, 0),
                "v1.0.0",
                pull_requests,
                {"v1.0.1": "f" * 40},
            )


class CanonicalJsonTests(unittest.TestCase):
    def test_serialization_is_compact_and_deterministic(self) -> None:
        left = release_plan.canonical_json({"z": [3, 2, 1], "a": {"y": 2, "x": 1}})
        right = release_plan.canonical_json({"a": {"x": 1, "y": 2}, "z": [3, 2, 1]})

        self.assertEqual(left, right)
        self.assertEqual({"a": {"x": 1, "y": 2}, "z": [3, 2, 1]}, json.loads(left))
        self.assertNotIn(" ", left)


class PullRequestLookupTests(unittest.TestCase):
    def test_retries_a_short_post_merge_indexing_lag(self) -> None:
        sha = "a" * 40
        responses = iter([[], [], [merged_pull_request(270, sha)]])

        class SequencedRunner:
            @staticmethod
            def run(
                arguments: object, *, check: bool = True
            ) -> subprocess.CompletedProcess[str]:
                del check
                return subprocess.CompletedProcess(
                    arguments,
                    0,
                    stdout=json.dumps(next(responses)),
                    stderr="",
                )

        with mock.patch.object(release_plan.time, "sleep") as sleep:
            pull_requests = release_plan.pull_requests_for_commit(
                SequencedRunner(), "owner/repository", sha
            )

        self.assertEqual([270], [pull_request["number"] for pull_request in pull_requests])
        self.assertEqual([mock.call(1), mock.call(2)], sleep.call_args_list)


class CompletePlanTests(unittest.TestCase):
    def test_an_older_queued_target_produces_an_empty_plan(self) -> None:
        target_sha = "a" * 40
        main_sha = "b" * 40
        runner = object()

        with (
            mock.patch.object(
                release_plan,
                "resolve_commit",
                side_effect=lambda unused_runner, revision: {
                    "target": target_sha,
                    "main": main_sha,
                }[revision],
            ),
            mock.patch.object(
                release_plan,
                "first_parent_history",
                return_value=[main_sha, target_sha],
            ),
            mock.patch.object(release_plan, "release_exists") as release_exists,
        ):
            plan = release_plan.build_plan(
                runner,
                target_revision="target",
                main_revision="main",
                repository="owner/repository",
            )

        self.assertTrue(plan["stale_target"])
        self.assertEqual([], plan["items"])
        release_exists.assert_not_called()

    def test_a_latest_tag_without_a_release_is_repaired(self) -> None:
        sha = "c" * 40
        tag = release_plan.StableTag("v4.5.6", (4, 5, 6), sha)
        runner = object()

        with (
            mock.patch.object(release_plan, "resolve_commit", return_value=sha),
            mock.patch.object(release_plan, "first_parent_history", return_value=[sha]),
            mock.patch.object(
                release_plan,
                "stable_tags",
                return_value=([tag], {tag.name: tag.sha}),
            ),
            mock.patch.object(release_plan, "release_exists", return_value=False),
            mock.patch.object(release_plan, "pull_requests_for_commit") as pull_requests,
        ):
            plan = release_plan.build_plan(
                runner,
                target_revision="target",
                main_revision="main",
                repository="owner/repository",
            )

        self.assertEqual(
            [
                {
                    "bump": None,
                    "kind": "repair-release",
                    "previous_tag": None,
                    "pr_number": None,
                    "sha": sha,
                    "tag": "v4.5.6",
                }
            ],
            plan["items"],
        )
        pull_requests.assert_not_called()


if __name__ == "__main__":
    unittest.main()
