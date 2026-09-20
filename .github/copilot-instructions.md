# Copilot instructions

This Terraform module generates validated names for Azure DevOps resources and concepts. It does not depend on the Azure DevOps provider; its only required provider is `hashicorp/random`. Keep public-interface changes backward compatible unless a documented major-version migration is intended.

## Module structure

- main.tf defines local.azdo: each resource has name, name_unique, regex, min_length, max_length, scope, and slug metadata.
- validation.tf mirrors that map in local.validation. Use greater-than-or-equal length checks so a name at its stated minimum is valid.
- outputs.tf exposes every public resource object and the validation map. Add an output whenever adding a new local.azdo key.
- Branch variants are maps keyed by work item. Both dash and slash variants are valid Azure DevOps Git ref names; do not reintroduce slash into their prohibited-character regex.

## Tests and documentation

- Add a focused native Terraform test under tests for any behaviour change. Run terraform fmt -check -recursive, terraform init -backend=false -input=false, terraform validate, and terraform test -verbose.
- Do not hand-edit content between the start_of_terraform_docs and end_of_terraform_docs markers. Regenerate it with the terraform-docs pre-commit hooks.
- The pull-request workflow checks documentation drift without pushing to contributor branches. Scheduled maintenance may open one bot pull request for generated documentation.
- Examples use Azure DevOps resources and should keep their internal Terraform references correct.

## Contribution and release conventions

- Use a branch prefix recognised by the repository labeler, such as `feature/`, `feat/`, `fix/`, `bugfix/`, `hotfix/`, `docs/`, `documentation/`, `security/`, `ci/`, `chore/`, `deps/`, `renovate/`, or `dependabot/`.
- Use a conventional pull-request title and update CHANGELOG.md for a release-worthy user-facing change.
- Every merge to `main` produces a release after validation. Patch is the default increment; use the `module-release:minor` or `module-release:major` pull-request label when required.
- Published version tags are Terraform Registry inputs. Do not move, replace, delete, or reuse them.
- Keep GitHub Actions pinned to full commit SHAs and grant each job only the permissions it needs. Do not add secrets: inherit unless the called workflow explicitly requires a named secret.
