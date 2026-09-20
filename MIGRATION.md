# Migration Guide: v11 → v12

Version 12 deliberately corrects naming and validation behaviour that could not be changed safely in v11. The output keys remain available, but some generated values, metadata, and one validation result shape change. Treat this as a stateful infrastructure migration: review a real plan before applying it.

## TL;DR

Pin the new major version explicitly:

```diff
 module "azdo_naming" {
   source  = "DownAtTheBottomOfTheMoleHole/naming/azuredevops"
-  version = ">= 11.0.0, < 12.0.0"
+  version = ">= 12.0.0, < 13.0.0"
 }
```

Then run `terraform init -upgrade` and inspect `terraform plan`. Do not assume a no-op upgrade: name changes can update or replace resources that consume module outputs.

## Why this is a major release

In v11, each `name_unique` value was truncated after the unique token was appended. At a resource's maximum length, truncation could remove some or all of that token and could make `name_unique` equal `name`. Version 12 reserves room for the separator and complete unique token before truncating the non-unique portion.

For example, with a four-character token of `a1b2`:

```text
v11: <base truncated at the resource limit, possibly without a1b2>
v12: <shortened base>-a1b2
```

This correction applies consistently to every naming output. Short names generally remain unchanged; names at or near a maximum length can change.

## Behaviour changes

### Complete unique tokens are reserved

- Every non-empty unique token is retained at the end of `name_unique`.
- The base is shortened first when the complete value would exceed `max_length`.
- A collision guard keeps `name_unique` distinct from `name`, including adversarial boundary values.
- `unique_length = 0` remains supported and disables the generated unique token.
- `unique_length` must now be a whole number from `0` through `47`. The upper bound lets the complete token fit within the shortest supported Azure DevOps name limit while normally retaining a base character and separator; the collision guard may shorten the base further.

If a wrapper module exposes `unique_length`, apply the same range there so callers receive an early, consistent error.

### Empty prefix and suffix elements are discarded

Empty strings in `prefix` and `suffix` are removed before components are joined. This avoids leading, trailing, or repeated separators.

```hcl
prefix = ["", "platform", ""]
suffix = ["", "production", ""]
```

The effective components are now `platform` and `production`. Configurations that intentionally relied on empty elements producing extra dashes will generate different names.

### Git branch rules match Git and Azure DevOps

Branch metadata and validation now:

- allow periods in otherwise valid branch names;
- reject spaces, control characters, malformed path components, `..`, `@{`, trailing separators, and other invalid ref patterns;
- use the Azure DevOps maximum of 250 characters; and
- validate dash variants as single-component names while allowing path separators only in slash variants.

The dash and slash families are therefore intentionally distinct. If a work-item value contains `/`, use a slash output only when the resulting full ref is valid; a dash output will reject it rather than silently treating it as a path.

### `validation.environment_work_item` is now validation data

In v11, this entry accidentally returned the generated naming metadata instead of validation booleans. In v12 it has the same shape as the other validation entries:

```hcl
module.azdo_naming.validation.environment_work_item[environment][work_item] = {
  valid_name        = bool
  valid_name_unique = bool
}
```

Code that used the old entry as a naming output should switch to the direct output, which retains the naming metadata:

```diff
-module.azdo_naming.validation.environment_work_item[environment][work_item].name
+module.azdo_naming.environment_work_item[environment][work_item].name
```

The same migration applies to `.name_unique`, `.slug`, `.regex`, length fields, and scope metadata. Code that actually wants validation should use `.valid_name` or `.valid_name_unique` from the corrected `validation` entry.

### Metadata reflects Azure DevOps contracts

Incorrect `regex`, `scope`, `max_length`, `min_length`, and separator metadata has been corrected. Notable changes include:

| Output family                                                     | v12 contract                                                 |
| ----------------------------------------------------------------- | ------------------------------------------------------------ |
| Git branches                                                      | Maximum 250; full Git ref validation; periods allowed        |
| Teams                                                             | Maximum 64                                                   |
| Organisations                                                     | Maximum 49; global scope; one-character names allowed        |
| Groups and security groups                                        | Maximum 256; project or organisation scope                   |
| Pipeline matrix keys                                              | Maximum 100; identifier-safe characters                      |
| Pipeline stages, jobs, and variables                              | Identifier-safe underscore-separated names                   |
| Work-item tracking fields                                         | Space-separated field names and corrected organisation scope |
| Build folders, feeds, packages, paths, queries, wikis, and boards | Service-specific regex and scope metadata                    |

Consumers that enforce policy from these metadata fields may produce different results even when the generated name itself does not change.

## Replacement and operational risks

The module only calculates strings; the downstream provider decides whether a changed string is updated in place or forces replacement. Pay particular attention to:

- resources using `name_unique` whose existing names are near their maximum length;
- pipeline stage, job, variable, matrix, and variable-group-variable names, which now use identifier-safe separators;
- branch resources, where a renamed ref may create a new branch and remove the old one;
- configurations containing empty `prefix` or `suffix` elements; and
- policies or tests that compare metadata or the old `validation.environment_work_item` shape.

Terraform `moved` blocks do not prevent replacement caused by a changed resource argument. For stateful or protected resources, follow the provider's rename/import procedure and coordinate any branch or pipeline rename with its users before applying.

## Recommended upgrade procedure

1. Pin the latest v11 release temporarily and record the current outputs for a representative workspace.
2. Search for consumers of `name_unique`, pipeline identifier outputs, and `validation.environment_work_item`.
3. Move any naming-metadata reads from `validation.environment_work_item` to the direct `environment_work_item` output.
4. Confirm every configured `unique_length` is an integer between `0` and `47`.
5. Remove empty elements from `prefix` and `suffix` explicitly; this makes the intended result clear even though v12 compacts them automatically.
6. Change the version constraint to `>= 12.0.0, < 13.0.0` and run `terraform init -upgrade`.
7. Run `terraform plan` for every affected workspace. Review each rename, update, deletion, and replacement rather than applying a saved plan from v11.
8. Coordinate changes to protected branches, pipelines, service connections, or other shared names before applying.
9. Apply in a non-production workspace first and confirm Azure DevOps accepts every resulting name.

## Upgrading from v10 or earlier

Upgrade through the v11 requirements as well. Version 11 raised the minimum Terraform version from `>= 1.10.0` to `>= 1.14.0` and `hashicorp/random` from `>= 3.6.0` to `>= 3.8.0`, and added the output families documented in the [v11.0.0 changelog](./CHANGELOG.md#1100--2026-05-01). Complete those toolchain updates before evaluating the v12 plan.

## Reference and support

The generated [Terraform reference](./TERRAFORM.md) is the authoritative list of current inputs and outputs.

The corrected contracts are based on Microsoft's [Azure DevOps naming restrictions](https://learn.microsoft.com/en-us/azure/devops/organizations/settings/naming-restrictions?view=azure-devops), the Azure Repos [250-character branch limit](https://learn.microsoft.com/en-us/azure/devops/repos/git/create-branch?view=azure-devops), and Git's [`check-ref-format` rules](https://git-scm.com/docs/git-check-ref-format).

- Bugs: <https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming/issues>
- Discussions: <https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming/discussions>
