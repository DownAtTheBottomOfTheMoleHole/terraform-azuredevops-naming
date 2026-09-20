# Migration Guide: v10 → v11

Version 11 does not remove or reshape existing v10 naming outputs. It does, however, raise the minimum Terraform and `hashicorp/random` versions and add optional inputs and outputs, so wrapper modules and build images should be checked before upgrading.

## TL;DR

```diff
 module "azdo_naming" {
   source  = "DownAtTheBottomOfTheMoleHole/naming/azuredevops"
-  version = ">= 10.0.0, < 11.0.0"
+  version = ">= 11.0.0, < 12.0.0"
 }
```

That is the only module-block change for most users once their toolchain meets the new baselines. Read on if you maintain wrapper modules, downstream tests, or pinned provider versions.

## Baseline version bumps

| Component          | v10 minimum | v11 minimum |
| ------------------ | ----------- | ----------- |
| Terraform          | `>= 1.10.0` | `>= 1.14.0` |
| `hashicorp/random` | `>= 3.6.0`  | `>= 3.8.0`  |

Both bumps are widely supported by current toolchains. If you are pinned below these versions you must upgrade your local CLI / CI image before adopting v11.

## What was added

v11 adds naming outputs and eight reserved optional inputs. Existing v10 outputs were not renamed, removed, or retyped, and their `slug`, `regex`, and length metadata remain compatible.

### New Azure DevOps resource naming definitions (PR #245)

Standardised naming metadata for additional Azure DevOps resources, including:

- Service endpoints (Azure RM, AWS, GitHub, Docker Registry, Kubernetes, generic, etc.)
- Environment, agent pool, agent queue
- Build-validation branch policy (the module does not currently expose other branch-policy variants)
- Variable group, dashboard, feed, wiki page

The module does not require the `microsoft/azuredevops` provider. These outputs are naming metadata for consumers to pass to their own Azure DevOps resources; the module itself requires only `hashicorp/random`.

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

These inputs are currently no-ops: setting them does not change any output. They are reserved for potential future per-item outputs.

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

The v11.0.0 release summary is in [`CHANGELOG.md`](./CHANGELOG.md). The generated [Terraform reference](./TERRAFORM.md) is the authoritative list of current inputs and outputs.

## Reporting issues

- Bugs: <https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming/issues>
- Discussions: <https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming/discussions>
