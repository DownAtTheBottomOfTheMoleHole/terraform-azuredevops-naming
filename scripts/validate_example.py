#!/usr/bin/env python3
"""Validate a published example against the module in the current checkout."""

from __future__ import annotations

import argparse
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parent.parent
REGISTRY_SOURCE = "DownAtTheBottomOfTheMoleHole/naming/azuredevops"
SOURCE_PATTERN = re.compile(
    rf'(?m)^(?P<indent>\s*)source\s*=\s*"{re.escape(REGISTRY_SOURCE)}"\s*$'
)
VERSION_PATTERN = re.compile(r'(?m)^\s*version\s*=\s*"[^"\n]+"\s*\n')


def run(terraform: str, directory: Path, *arguments: str) -> None:
    """Run one Terraform command and raise with its useful output on failure."""

    environment = os.environ.copy()
    environment.update({"TF_IN_AUTOMATION": "true", "TF_INPUT": "0"})
    result = subprocess.run(
        [terraform, f"-chdir={directory}", *arguments],
        check=False,
        capture_output=True,
        env=environment,
        text=True,
    )
    if result.returncode != 0:
        details = (result.stderr or result.stdout).strip()
        raise SystemExit(f"terraform {' '.join(arguments)} failed:\n{details}")


def localise_example(main_file: Path) -> None:
    """Point the temporary example at the copied local module."""

    content = main_file.read_text(encoding="utf-8")
    content, source_count = SOURCE_PATTERN.subn(
        lambda match: f'{match.group("indent")}source  = "../module"',
        content,
    )
    content, version_count = VERSION_PATTERN.subn("", content)
    if source_count != 1 or version_count != 1:
        raise SystemExit(
            "The example must contain exactly one registry module source and one version constraint; "
            f"found {source_count} source lines and {version_count} version lines."
        )
    main_file.write_text(content, encoding="utf-8")


def validate(example: Path) -> None:
    """Copy and validate one example without altering its published source block."""

    terraform = shutil.which("terraform")
    if terraform is None:
        raise SystemExit("terraform was not found on PATH")

    source_example = example.resolve()
    try:
        source_example.relative_to(ROOT)
    except ValueError as error:
        raise SystemExit(f"Example must be inside {ROOT}: {source_example}") from error
    if not source_example.is_dir():
        raise SystemExit(f"Example directory does not exist: {source_example}")

    with tempfile.TemporaryDirectory(prefix="terraform-example-validation-") as temp_name:
        temporary_root = Path(temp_name)
        module_directory = temporary_root / "module"
        example_directory = temporary_root / "example"
        module_directory.mkdir()
        example_directory.mkdir()

        for terraform_file in ROOT.glob("*.tf"):
            shutil.copy2(terraform_file, module_directory / terraform_file.name)
        for terraform_file in source_example.glob("*.tf"):
            shutil.copy2(terraform_file, example_directory / terraform_file.name)

        localise_example(example_directory / "main.tf")
        run(terraform, example_directory, "init", "-backend=false", "-input=false", "-no-color")
        run(terraform, example_directory, "validate", "-no-color")

    print(f"Validated {source_example.relative_to(ROOT)} against the local module checkout")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("example", type=Path, help="example directory relative to the repository root")
    args = parser.parse_args()
    validate(ROOT / args.example)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
