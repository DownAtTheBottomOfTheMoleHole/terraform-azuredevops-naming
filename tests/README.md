# Tests

This directory contains the [native `terraform test`](https://developer.hashicorp.com/terraform/language/tests) suite for the `terraform-azuredevops-naming` module. It is inspired by the patterns established by the [Azure Verified Modules (AVM)](https://github.com/Azure/terraform-azurerm-avm-template) test layout.

## Running locally

```bash
terraform init -backend=false -input=false
terraform test -verbose
```

`terraform test` executes every `*.tftest.hcl` file in this directory. The tests exercise this module and its `hashicorp/random` dependency only—no Azure DevOps credentials or Azure DevOps provider are required.

The release planner and its workflow wiring have separate Python regression tests:

```bash
python3 -m unittest discover -s tests -p "test_release_*.py"
```

These tests cover semantic-version planning, merged-PR provenance, repair of a missing GitHub release, fail-closed plan handling, and removal of persisted checkout credentials.

## Running a single file

```bash
terraform test -filter=tests/defaults.tftest.hcl
```

## Test catalogue

| File                           | What it asserts                                                                                           |
| ------------------------------ | --------------------------------------------------------------------------------------------------------- |
| `defaults.tftest.hcl`          | A zero-argument invocation, default environment translation, and the default unique-suffix length.        |
| `prefix_suffix.tftest.hcl`     | Representative prefix/suffix ordering, lower-casing, and empty-prefix behaviour.                          |
| `environments.tftest.hcl`      | Every accepted short environment tag and duplicate translated values.                                     |
| `input_validation.tftest.hcl`  | Fractional unique lengths and explicit-null fallback behaviour for consumed inputs.                       |
| `branches.tftest.hcl`          | Every work-item branch variant, plus representative separator, lower-case, and validation behaviour.      |
| `validation.tftest.hcl`        | Representative core outputs, minimum length, maximum length, and selected service-endpoint regex checks.  |
| `length_boundaries.tftest.hcl` | Truncation for key 64-character outputs and maximum-length checks across a representative set of outputs. |
| `regex_compliance.tftest.hcl`  | Explicitly enumerated simple outputs and service endpoints against their declared regular expressions.    |

The suite is deliberately representative where Terraform cannot iterate across output symbols dynamically. It does not prove every field of every output; maintain the explicit lists when the public surface changes.

## Adding new tests

When you add a new key to `local.azdo`:

1. Add the public output and its corresponding entry in `local.validation`.
2. Add simple or service-endpoint outputs to the explicit lists in `regex_compliance.tftest.hcl`; add representative maximum-length coverage where appropriate.
3. For mapped outputs or non-trivial inputs, add a focused `*.tftest.hcl` case rather than implying generic coverage.
4. Run `terraform fmt -check -recursive`, `terraform validate`, and `terraform test -verbose` locally before pushing.

## CI

Tests run against Terraform 1.14 and the latest available version on every pull request via [`.github/workflows/pullrequest.yml`](../.github/workflows/pullrequest.yml). The same matrix runs after pushes to `main` and during the daily 02:17 UTC maintenance workflow in [`scheduled_maintenance.yml`](../.github/workflows/scheduled_maintenance.yml).
