# Changelog

All notable changes to this module are documented here. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [11.0.0] — Unreleased

### Highlights

- **Strictly additive release.** No existing v10 output was renamed, removed, or had its type or shape changed.
- 30+ new resource naming definitions covering both the `microsoft/azuredevops` provider surface and useful conceptual types.
- 8 new optional input lists (all default to `[]`) that pave the way for upcoming `for_each`-style outputs.
- Modernised README hero, badges, and quick start.

### Added

- 11 service-endpoint naming definitions (Azure RM, AWS, GitHub, Docker Registry, Kubernetes, generic, etc.). (#244)
- 18 additional provider-backed resource naming definitions including environment, agent pool / queue, multiple branch policy variants, variable group, dashboard, feed, wiki page. (#245)
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
