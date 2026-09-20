# Changelog

All notable changes to this module are documented here. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- markdownlint-disable MD024 -->

## [12.0.0] — 2026-09-21

### Added

- Add deterministic regression coverage that exercises every one of the 107 public naming outputs at its maximum-length boundary and validates every generated Git branch with Git itself. (#273)
- Validate registry-facing v12 examples against the local checkout so the major-release pull request is tested before v12 exists in the Terraform Registry. (#273)

### Changed

- Reserve the complete unique token before truncating each `name_unique` output, compact empty prefix/suffix elements before joining, and constrain `unique_length` to `0` through `47`. (#273)
- Align branch, project, repository, team, organization, group, pipeline, feed, package, work-item, wiki, path, and board naming metadata with documented Azure DevOps and Git contracts. (#273)
- Compose pipeline identifiers with underscores so generated stage, job, variable, variable-group-variable, and matrix names satisfy Azure Pipelines rules. (#273)

### Fixed

- Keep `name_unique` distinct from `name` at maximum lengths, including when the original value already ends with the deterministic token. (#273)
- Return `{ valid_name, valid_name_unique }` booleans from `validation.environment_work_item`; consumers of the legacy metadata shape can use the direct `environment_work_item` output. (#273)
- Validate minimum and maximum lengths consistently for ordinary and unique names, and model dash-only and slash-capable Git branch variants separately. (#273)

## [11.0.6] — 2026-09-20

### Added

- Automatically create a SemVer tag and GitHub release after each successful merge to `main`; `module-release:major` and `module-release:minor` select larger increments, with patch as the default.
- Add unit coverage for strict tag parsing, release increments, merge provenance, backlog ordering, conflicting labels, tag collisions, and deterministic release plans.
- Document the immutable-tag workflow used by the Terraform Registry to discover module releases.

### Changed

- Audit the README, migration guide, test guide, contribution guidance, issue forms, pull-request template, and generated-documentation templates for the current module behaviour.
- Clearly document the eight reserved list inputs that are accepted but do not yet affect outputs.
- Reject fractional `unique_length` values with a clear validation error and make explicit nulls on consumed optional inputs fall back to their documented defaults.
- Commit the root provider lock file so documentation fixtures and CI resolve the same provider package; keep Terraform apply-based fixture generation as an explicit manual local hook.
- Pin the isolated Go toolchain used to build the repository's terraform-docs pre-commit hook so it remains reproducible on machines without Go and with newer system Go releases.

### Security

- Disable the unused MegaLinter GitHub status reporter and remove its unnecessary write permission from pull-request checks.
- Bind release-planner code and tests to the exact commit being tagged in push, scheduled, and manual runs, and clean generated state between commit validations.

## [11.0.5] — 2026-09-20

### Added

- Add a native `terraform test` suite and run validation, tests, documentation checks, and security analysis in CI. (#270)
- Add a security policy with private vulnerability-reporting guidance. (#270)

### Changed

- Pin third-party GitHub Actions and reusable workflows to immutable revisions. (#270)
- Validate SemVer tags, changelog entries, `main` ancestry, formatting, configuration, and tests before publishing a release. (#270)

### Security

- Apply explicit least-privilege permissions to workflow jobs, gate privileged operations on trusted events, restrict secret synchronisation to an allowlist, and harden SARIF upload behaviour. (#270)

## [11.0.4] — 2026-05-03

### Fixed

- Correct null-output examples and refresh generated module-version metadata. (#258)

## [11.0.3] — 2026-05-03

### Fixed

- Add `id` to `<h1>` for TOC anchor compatibility and wrap tagline in `<p>` element for correct Terraform Registry rendering. (#255)
- Convert Markdown inside `<div>` header to HTML so the Terraform Registry renders it correctly. (#255)

## [11.0.2] — 2026-05-03

### Fixed

- Trim badge wall and fix URL-encoded alt text for cleaner Terraform Registry render. (#254)

## [11.0.1] — 2026-05-02

### Fixed

- Use absolute URLs so the Terraform Registry renders the banner and links correctly. (#253)

## [11.0.0] — 2026-05-01

### Highlights

- **Output-compatible release.** No existing v10 naming output was renamed, removed, or had its type or shape changed; the minimum Terraform and `hashicorp/random` versions were raised.
- New naming definitions for a broad set of commonly used Azure DevOps resources and useful conceptual types.
- 8 reserved optional input lists (all default to `[]`) that pave the way for future `for_each`-style outputs; they do not affect outputs in v11.0.0.
- Modernised README hero, badges, and quick start.

### Added

- 11 service-endpoint naming definitions (Azure RM, AWS, GitHub, Docker Registry, Kubernetes, generic, etc.). (#244)
- Additional resource naming definitions including environment, agent pool / queue, the build-validation branch policy, variable group, dashboard, feed, and wiki page. (#245)
- 12 conceptual resource naming definitions:
  - `pipeline_stage`, `pipeline_job`, `pipeline_variable`, `pipeline_matrix`
  - `artifact_package` (lower-cased)
  - `area_path`, `iteration_path`
  - `board_column`, `board_swimlane`
  - `organization`, `process`, `security_group`
    (#246)
- 8 new optional input list variables, all `default = []`:
  - `area_paths`, `iteration_paths`
  - `dashboards`, `feeds`, `wiki_pages`
  - `pipeline_stages`, `pipeline_jobs`, `pipeline_variables`
    (#247)
- `MIGRATION.md` and `CHANGELOG.md`.
- README hero block, modern badges, "What's new in v11" callout, and quick-start example. (#248)

### Changed

- Bumped minimum Terraform from `>= 1.10.0` to `>= 1.14.0`.
- Bumped minimum `hashicorp/random` from `>= 3.6.0` to `>= 3.8.0`.
- Bumped example version constraints to `>= 11.0.0, < 12.0.0`.
- Bumped GitHub Actions versions across workflows.

### Deprecated

- _None._

### Removed

- _None._

### Fixed

- _None._

### Security

- _None._

## [10.x] and earlier

See the [GitHub releases page](https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming/releases) for the history prior to v11.

<!-- markdownlint-enable MD024 -->
