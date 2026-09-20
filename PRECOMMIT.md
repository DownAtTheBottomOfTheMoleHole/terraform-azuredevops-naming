# Pre-commit guide

This repository uses [pre-commit](https://pre-commit.com/) for fast local checks and generated documentation. The configuration in [`.pre-commit-config.yaml`](.pre-commit-config.yaml) is the source of truth.

## Prerequisites

Install these tools before running the default hooks:

- Git
- Python 3 and `pre-commit` 3.0 or newer
- Terraform `>= 1.14.0, < 2.0.0`
- TFLint

For example, install pre-commit with `pipx install pre-commit` or the package manager recommended for your operating system. Pre-commit creates isolated environments for hooks such as Prettier, cspell, detect-secrets, and terraform-docs; those CLIs do not need separate global installations for the configured hooks. The configuration bootstraps a compatible Go toolchain for the pinned terraform-docs release.

Some manual hooks have additional prerequisites:

- **MegaLinter:** Docker Engine or Docker Desktop must be running.
- **Infracost:** the Infracost CLI and a valid `INFRACOST_API_KEY`.
- **tfupdate:** the tfupdate CLI if it is not already available in your environment.

## Install and run

From the repository root:

```bash
pre-commit install
pre-commit run --all-files
```

The default run performs repository hygiene and syntax checks; AWS credential and private-key detection; spelling and Prettier checks; Terraform formatting, validation, and TFLint; and terraform-docs generation for the root module and both examples. When `CHANGELOG.md` changes, it synchronises `terraform-docs/module_version.txt` with the latest versioned changelog heading.

Review the working tree after a run. Formatting and documentation hooks can update files, and the module-version hook intentionally fails its first run when it changes the version file so that the generated change can be staged and checked.

## Manual hooks

Manual hooks do not run during `pre-commit run --all-files`. Invoke them explicitly:

```bash
# Regenerate output examples after reviewing and trusting root Terraform changes.
# This performs a backend-disabled Terraform apply in a temporary directory.
pre-commit run --hook-stage manual generate-terraform-docs-values --all-files

# Scan the repository for likely secrets.
pre-commit run --hook-stage manual detect-secrets --all-files

# Run all configured tfupdate entries (Terraform, Azure DevOps, and random).
pre-commit run --hook-stage manual tfupdate --all-files

# Run the configured Terraform cost check.
pre-commit run --hook-stage manual infracost_breakdown --all-files

# Run MegaLinter in Docker with automatic fixes enabled.
pre-commit run --hook-stage manual megalinter-incremental --all-files
```

The module does not declare the Azure DevOps provider, so the retained Azure DevOps tfupdate entry normally has no constraint to change. It exists for compatibility with the shared repository template.

The root `.terraform.lock.hcl` is committed so documentation generation and CI use the same `hashicorp/random` package. Do not run the output-value generator on an unreviewed checkout: Terraform provider and provisioner code is executable even when the backend is disabled.

## Common issues

### A suspected secret is safe test data

First confirm that the value is not a real credential. For an intentional false positive, add the narrow inline annotation supported by the scanner, such as `# pragma: allowlist secret`, beside that value. Never allowlist an actual secret or commit debug output that may contain credentials.

### Spelling failures

Correct the text where possible. Add a project-specific term to the `words` array in `.cspell.json` only when the spelling is intentional.

### Terraform validation cannot initialise

Confirm that Terraform can reach the provider registry and that the required Terraform and TFLint executables are on `PATH`. You can reproduce the module checks directly with:

```bash
terraform init -backend=false -input=false
terraform validate
terraform test -verbose
```

### MegaLinter cannot start

Confirm Docker Engine or Docker Desktop is running and that the current user can start containers. The manual hook removes its container after the run.

## Hooks that can modify files

Review changes produced by these hooks before committing:

- module-version synchronisation
- deterministic output-value fixture generation (manual hook)
- end-of-file, line-ending, and trailing-whitespace fixes
- Prettier
- `terraform fmt`
- terraform-docs for `README.md`, `TERRAFORM.md`, and both example READMEs
- the manual MegaLinter hook when run with its configured fix mode
