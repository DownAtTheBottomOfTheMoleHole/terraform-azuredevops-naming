# Migration Guide: v10 → v11

This release of `terraform-azuredevops-naming` is **strictly additive**. Existing v10 consumers should be able to upgrade with no code changes.

## TL;DR

```diff
 module "azdo_naming" {
   source  = "DownAtTheBottomOfTheMoleHole/naming/azuredevops"
-  version = ">= 10.0.0, < 11.0.0"
+  version = ">= 11.0.0, < 12.0.0"
 }
```

That's it for most users. Read on if you maintain wrapper modules, downstream tests, or pinned provider versions.

## Baseline version bumps

| Component | v10 minimum | v11 minimum |
| --- | --- | --- |
| Terraform | `>= 1.10.0` | `>= 1.14.0` |
| `hashicorp/random` | `>= 3.6.0` | `>= 3.8.0` |

Both bumps are widely supported by current toolchains. If you are pinned below these versions you must upgrade your local CLI / CI image before adopting v11.

## What was added

v11 adds new outputs only. Nothing was renamed, removed, retyped, or had its `slug`/`regex`/`max_length` changed.

### New provider-backed resource definitions (PR #245)

Standardised naming for 18 resources from the `microsoft/azuredevops` provider, including (non-exhaustive):

- Service endpoints (Azure RM, AWS, GitHub, Docker Registry, Kubernetes, generic, etc.)
- Environment, agent pool, agent queue
- Branch policy variants (build validation, comment resolution, min reviewers, work item linking, etc.)
- Variable group, dashboard, feed, wiki page

### New conceptual resource definitions (PR #246)

Standardised naming for 12 concepts that the provider does not model directly but that are useful for downstream pipeline / board / artifact code:

- `pipeline_stage`, `pipeline_job`, `pipeline_variable`, `pipeline_matrix`
- `artifact_package` (lower-cased)
- `area_path`, `iteration_path`
- `board_column`, `board_swimlane`
- `organization`, `process`, `security_group`

### New optional input variables (PR #247)

Eight new optional list inputs, all defaulting to `[]`:

- `area_paths`, `iteration_paths`
- `dashboards`, `feeds`, `wiki_pages`
- `pipeline_stages`, `pipeline_jobs`, `pipeline_variables`

These are no-ops on their own and exist to enable upcoming `for_each`-style outputs in a future minor release.

## What did NOT change

- All existing v10 outputs keep their **key**, **type**, and **shape**.
- The `local.environment_mapping` table is unchanged.
- Slug values for existing resources are unchanged.
- Validation regex / `max_length` / `min_length` for existing resources are unchanged.
- The `<!-- start_of_terraform_docs -->` … `<!-- end_of_terraform_docs -->` regeneration flow is unchanged.

## Compatibility checklist

Before merging the version bump in your downstream code:

- [ ] Confirm Terraform CLI is `>= 1.14.0` in every CI image / dev environment.
- [ ] Confirm `hashicorp/random` constraint resolves to `>= 3.8.0`.
- [ ] Run `terraform init -upgrade` followed by `terraform plan` against a representative workspace; expect **no diff** in resources whose names come from this module.
- [ ] If you read `module.azdo_naming.<resource>` in tests, no assertion should change.

If you do see a diff, please open an issue with the exact resource and the before/after values — that would indicate a bug in v11, not an intended change.

## New outputs reference

A complete list of every new output is in [`CHANGELOG.md`](./CHANGELOG.md) under the `v11.0.0` section.

## Reporting issues

- Bugs: <https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming/issues>
- Discussions: <https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming/discussions>
