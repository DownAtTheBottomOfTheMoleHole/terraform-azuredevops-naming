#!/usr/bin/env python3
"""
Update terraform-docs/module_version.txt from the latest version in CHANGELOG.md.

Reads the first semantic-version heading (## [X.Y.Z]) in CHANGELOG.md,
extracts the major version X, and writes ">= X.0.0, < (X+1).0.0" to
terraform-docs/module_version.txt.

Used as a pre-commit hook so the version constraint in the generated
"Consuming terraform-azuredevops-naming" code block stays in sync
with the codebase automatically.
"""

import re
import sys
from pathlib import Path

CHANGELOG = Path("CHANGELOG.md")
VERSION_FILE = Path("terraform-docs/module_version.txt")


def main() -> int:
    if not CHANGELOG.exists():
        print(f"ERROR: {CHANGELOG} not found", file=sys.stderr)
        return 1

    changelog_text = CHANGELOG.read_text(encoding="utf-8")

    match = re.search(r"^##\s+\[(\d+)\.\d+\.\d+\]", changelog_text, re.MULTILINE)
    if not match:
        print("ERROR: no semantic-version heading found in CHANGELOG.md", file=sys.stderr)
        return 1

    major = int(match.group(1))
    constraint = f">= {major}.0.0, < {major + 1}.0.0"

    current = VERSION_FILE.read_text(encoding="utf-8").strip() if VERSION_FILE.exists() else ""
    if current == constraint:
        return 0

    VERSION_FILE.write_text(constraint, encoding="utf-8")
    print(f"Updated {VERSION_FILE}: {constraint}")
    # Return 1 to fail the commit so the user can stage the updated file
    # and re-run the commit.  This is standard pre-commit hook behaviour
    # when a hook modifies a file on disk.
    return 1


if __name__ == "__main__":
    sys.exit(main())
