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

These tests cover semantic-version planning, merged-PR provenance, repair of a missing GitHub release, fail-closed plan handling, local-checkout example validation, and removal of persisted checkout credentials.

The all-output naming audit applies an oversized deterministic fixture and walks every public naming result:

```bash
python3 -m unittest -v tests/test_naming_contract.py
```

It proves that all 107 `name_unique` values retain the complete token, stay within their published limits, differ from `name`, pass the matching validation result, and produce Git-valid branch refs.

## Running a single file

```bash
terraform test -filter=tests/defaults.tftest.hcl
```

## Test catalogue

| File                            | What it asserts                                                                                              |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `defaults.tftest.hcl`           | A zero-argument invocation, default environment translation, and the default unique-suffix length.           |
| `prefix_suffix.tftest.hcl`      | Prefix/suffix ordering, lower-casing, and compaction of leading, interior, trailing, and all-empty elements. |
| `environments.tftest.hcl`       | Every accepted short environment tag and duplicate translated values.                                        |
| `input_validation.tftest.hcl`   | Fractional/out-of-range unique lengths and explicit-null fallback behaviour for consumed inputs.             |
| `branches.tftest.hcl`           | Every branch variant plus dotted, nested, malformed, dash-only, slash-capable, and Git-structural cases.     |
| `validation.tftest.hcl`         | Representative core outputs, minimum length, maximum length, and selected service-endpoint regex checks.     |
| `length_boundaries.tftest.hcl`  | Truncation for key 64-character outputs and maximum-length checks across a representative set of outputs.    |
| `regex_compliance.tftest.hcl`   | Explicitly enumerated simple outputs and service endpoints against their declared regular expressions.       |
| `unique_boundaries.tftest.hcl`  | Suffix reservation, collision avoidance, the 47-character ceiling, and zero-length behavior.                 |
| `metadata_contracts.tftest.hcl` | Corrected vendor limits/scopes, pipeline identifiers, and the standard validation payload.                   |
| `test_naming_contract.py`       | Dynamic maximum-boundary and Git checks across all 107 public naming outputs.                                |

The native suite is deliberately focused where Terraform cannot iterate across output symbols dynamically. The Python audit closes that gap by checking the complete public naming surface and failing if its count or validation shape drifts.

## Adding new tests

When you add a new key to `local.azdo`:

1. Add the public output and its corresponding entry in `local.validation`.
2. Add simple or service-endpoint outputs to the explicit lists in `regex_compliance.tftest.hcl`; the all-output audit must then report the new intentional output count.
3. For mapped outputs or non-trivial inputs, add a focused `*.tftest.hcl` case rather than implying generic coverage.
4. Run `terraform fmt -check -recursive`, `terraform validate`, `terraform test -verbose`, and `python3 -m unittest -v tests/test_naming_contract.py` locally before pushing.

## CI

Tests run against Terraform 1.14 and the latest available version on every pull request via [`.github/workflows/pullrequest.yml`](../.github/workflows/pullrequest.yml). The same matrix runs after pushes to `main` and during the daily 02:17 UTC maintenance workflow in [`scheduled_maintenance.yml`](../.github/workflows/scheduled_maintenance.yml).
