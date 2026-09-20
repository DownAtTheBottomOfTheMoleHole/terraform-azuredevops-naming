#!/usr/bin/env python3
"""Generate deterministic terraform-docs output values from the root module."""

from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parent.parent
OUTPUT_FILE = ROOT / "terraform-docs" / "default_values.json"
TERRAFORM_FILES = (
    "main.tf",
    "outputs.tf",
    "validation.tf",
    "variables.tf",
    "versions.tf",
    ".terraform.lock.hcl",
)
DOC_INPUTS = (
    '-var=prefix=["dbmh"]',
    '-var=suffix=["adonaming"]',
    '-var=work_items=["1234","1235"]',
    "-var=unique_seed=docs",
)


def run(terraform: str, working_dir: Path, *args: str) -> subprocess.CompletedProcess[str]:
    """Run Terraform in the isolated documentation fixture directory."""

    environment = os.environ.copy()
    environment["TF_IN_AUTOMATION"] = "1"
    result = subprocess.run(
        [terraform, f"-chdir={working_dir}", *args],
        check=False,
        capture_output=True,
        env=environment,
        text=True,
    )
    if result.returncode != 0:
        command = " ".join(("terraform", *args))
        details = (result.stderr or result.stdout).strip()
        raise SystemExit(f"{command} failed:\n{details}")
    return result


def generate() -> dict[str, object]:
    """Return deterministic `terraform output -json` data for documentation."""

    terraform = shutil.which("terraform")
    if terraform is None:
        raise SystemExit("terraform was not found on PATH")

    with tempfile.TemporaryDirectory(prefix="terraform-docs-values-") as temp_name:
        temp_dir = Path(temp_name)
        for relative_path in TERRAFORM_FILES:
            shutil.copy2(ROOT / relative_path, temp_dir / relative_path)

        run(terraform, temp_dir, "init", "-backend=false", "-input=false", "-no-color")
        run(
            terraform,
            temp_dir,
            "apply",
            "-auto-approve",
            "-input=false",
            "-no-color",
            *DOC_INPUTS,
        )
        result = run(terraform, temp_dir, "output", "-json", "-no-color")

    data = json.loads(result.stdout)
    if not isinstance(data, dict) or not data:
        raise SystemExit("terraform output returned no documentation values")
    return data


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--check", action="store_true", help="fail when the fixture is stale")
    mode.add_argument("--write", action="store_true", help="replace the fixture")
    args = parser.parse_args()

    generated = generate()
    if args.write:
        OUTPUT_FILE.write_text(
            json.dumps(generated, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        print(f"Updated {OUTPUT_FILE.relative_to(ROOT)} with {len(generated)} outputs")
        return 0

    try:
        current = json.loads(OUTPUT_FILE.read_text(encoding="utf-8"))
    except (FileNotFoundError, json.JSONDecodeError) as error:
        print(f"Documentation values are missing or invalid: {error}")
        return 1

    if current != generated:
        current_keys = set(current) if isinstance(current, dict) else set()
        generated_keys = set(generated)
        missing = sorted(generated_keys - current_keys)
        obsolete = sorted(current_keys - generated_keys)
        print("terraform-docs/default_values.json is stale.")
        if missing:
            print(f"Missing outputs: {', '.join(missing)}")
        if obsolete:
            print(f"Obsolete outputs: {', '.join(obsolete)}")
        print("Run: python3 scripts/generate_docs_values.py --write")
        return 1

    print(f"Documentation values match all {len(generated)} Terraform outputs")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
