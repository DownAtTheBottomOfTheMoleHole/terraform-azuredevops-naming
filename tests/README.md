# Tests

This directory contains the [native `terraform test`](https://developer.hashicorp.com/terraform/language/tests) suite for the `terraform-azuredevops-naming` module. It is inspired by the patterns established by the [Azure Verified Modules (AVM)](https://github.com/Azure/terraform-azurerm-avm-template) test layout.

## Running locally

```bash
terraform init
terraform test
```

`terraform test` will execute every `*.tftest.hcl` file in this directory. All tests run with `command = apply` against the `random` provider only — **no Azure DevOps credentials are required**.

## Running a single file

```bash
terraform test -filter=tests/defaults.tftest.hcl
```

## Test catalogue

| File | What it asserts |
|---|---|
| `defaults.tftest.hcl` | The module accepts zero arguments and produces non-empty outputs. |
| `prefix_suffix.tftest.hcl` | `prefix` / `suffix` inputs flow into generated names with correct ordering. |
| `environments.tftest.hcl` | Short environment tags are translated through `local.environment_mapping`. |
| `branches.tftest.hcl` | Branch outputs honour the dash vs slash separator and lowercase enforcement. |
| `validation.tftest.hcl` | Every `valid_name` and `valid_name_unique` flag in the validation map is `true` for representative inputs. |
| `length_boundaries.tftest.hcl` | Names are correctly truncated to per-resource `max_length`. |
| `regex_compliance.tftest.hcl` | All generated names match the per-resource regex captured from Microsoft naming-restrictions docs. |

## Adding new tests

When you add a new key to `local.azdo`:

1. Extend `validation.tftest.hcl` with an assertion that its `valid_name` flag is `true`.
2. If the key behaves differently for non-trivial inputs (e.g. takes a `for_each` input), add a focused `*.tftest.hcl` covering it.
3. Run `terraform test` locally before pushing — CI will block the merge otherwise.

## CI

Tests run on every pull request via [`.github/workflows/test.yml`](../.github/workflows/test.yml). They are also triggered weekly by `scheduled_maintenance.yml`.
