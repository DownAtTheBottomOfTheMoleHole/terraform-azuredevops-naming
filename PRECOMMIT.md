# Pre-commit Configuration Guide

## Cross-Platform Setup

This repository uses pre-commit hooks for code quality. Here's how to set up cross-platform:

### Prerequisites

```bash
# macOS
brew install pre-commit terraform terraform-docs

# Linux (Debian/Ubuntu)
sudo apt-get install pre-commit terraform

# Windows (using Chocolatey)
choco install pre-commit terraform terraform-docs

# Or use pip (all platforms)
pip install pre-commit detect-secrets
```

### Installation

```bash
# Install the pre-commit hooks
pre-commit install

# Run all hooks against all files
pre-commit run --all-files
```

## Optional Tools

Some hooks are set to `manual` stage and won't run automatically:

- **megalinter**: Requires Docker Desktop
- **infracost**: Requires API key (`INFRACOST_API_KEY`)
- **sign-commit**: Disabled (can corrupt files)

To run manual hooks:

```bash
pre-commit run --hook-stage manual megalinter-incremental --all-files
```

## Common Issues

### False Positive Secrets

If detect-secrets flags non-sensitive data:

1. Add inline comment: `# pragma: allowlist secret`
2. Or create `.secrets.baseline`:
   ```bash
   pip install detect-secrets
   detect-secrets scan --baseline .secrets.baseline
   ```

### Spelling Errors

Add words to `.config/.cspell.json` in the `words` array.

### Cross-Platform Paths

- Always use forward slashes (`/`) in configuration
- Avoid spaces in filenames (use `-` or `_`)
- Use relative paths from repository root

## Disabled Hooks

The following hooks are intentionally disabled to prevent issues:

- **log_file**: Removed from all hooks (cross-platform path issues)
- **verbose**: Removed to reduce noise
- **sign-commit**: Set to manual (corrupts files with signatures)

## Hooks That Modify Files

These hooks will auto-fix issues:

- `trailing-whitespace`
- `end-of-file-fixer`
- `mixed-line-ending`
- `terraform_fmt`
- `terraform-docs`
- `prettier`

After running, review and commit the changes.
