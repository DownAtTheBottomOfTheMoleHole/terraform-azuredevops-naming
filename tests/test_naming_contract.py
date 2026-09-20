"""Runtime contract checks for every public naming output.

The native Terraform tests cover focused examples.  This audit deliberately
walks every exported naming value so a newly added output cannot silently miss
the maximum-length unique-suffix boundary.
"""

from __future__ import annotations

import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest


REPOSITORY = Path(__file__).resolve().parents[1]
TOKEN = "u9x7"
DEFINITION_KEYS = {
    "name",
    "name_unique",
    "min_length",
    "max_length",
    "regex",
}
VALIDATION_KEYS = {"valid_name", "valid_name_unique"}


def _run(*arguments: str) -> subprocess.CompletedProcess[str]:
    environment = os.environ.copy()
    environment.update({"TF_IN_AUTOMATION": "true", "TF_INPUT": "0"})
    return subprocess.run(
        arguments,
        cwd=REPOSITORY,
        env=environment,
        check=True,
        capture_output=True,
        text=True,
    )


def _flatten_definitions(value: object, path: tuple[str, ...]) -> dict[tuple[str, ...], dict[str, object]]:
    if isinstance(value, dict) and DEFINITION_KEYS.issubset(value):
        return {path: value}
    if not isinstance(value, dict):
        raise AssertionError(f"Expected a definition or map at {'.'.join(path)}; got {type(value).__name__}")

    flattened: dict[tuple[str, ...], dict[str, object]] = {}
    for key, child in value.items():
        flattened.update(_flatten_definitions(child, (*path, key)))
    return flattened


def _flatten_validation(value: object, path: tuple[str, ...]) -> dict[tuple[str, ...], dict[str, bool]]:
    if isinstance(value, dict) and set(value) == VALIDATION_KEYS:
        if not all(isinstance(result, bool) for result in value.values()):
            raise AssertionError(f"Validation results at {'.'.join(path)} must be booleans")
        return {path: value}
    if not isinstance(value, dict):
        raise AssertionError(f"Expected a validation result or map at {'.'.join(path)}")

    flattened: dict[tuple[str, ...], dict[str, bool]] = {}
    for key, child in value.items():
        flattened.update(_flatten_validation(child, (*path, key)))
    return flattened


class NamingContractTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.temporary_directory = tempfile.TemporaryDirectory(prefix="terraform-naming-contract-")
        temporary_path = Path(cls.temporary_directory.name)
        cls.state_path = temporary_path / "terraform.tfstate"
        variables_path = temporary_path / "boundary.auto.tfvars.json"
        variables_path.write_text(
            json.dumps(
                {
                    "environment_tags": ["dev"],
                    "prefix": ["p" * 1200],
                    "suffix": ["s" * 1200],
                    "unique_length": len(TOKEN),
                    "unique_seed": TOKEN,
                    "work_items": ["w" * 1200],
                }
            ),
            encoding="utf-8",
        )

        _run("terraform", "init", "-backend=false", "-input=false", "-no-color")
        _run(
            "terraform",
            "apply",
            "-auto-approve",
            "-input=false",
            "-no-color",
            f"-state={cls.state_path}",
            f"-var-file={variables_path}",
        )
        raw_outputs = json.loads(
            _run("terraform", "output", "-json", f"-state={cls.state_path}").stdout
        )
        cls.outputs = {name: result["value"] for name, result in raw_outputs.items()}

        naming_outputs = {
            name: value
            for name, value in cls.outputs.items()
            if name not in {"unique_seed", "validation"}
        }
        cls.definitions: dict[tuple[str, ...], dict[str, object]] = {}
        for name, value in naming_outputs.items():
            cls.definitions.update(_flatten_definitions(value, (name,)))
        cls.validations = _flatten_validation(cls.outputs["validation"], ())

    @classmethod
    def tearDownClass(cls) -> None:
        cls.temporary_directory.cleanup()

    def test_all_107_public_naming_outputs_are_covered(self) -> None:
        naming_output_names = set(self.outputs) - {"unique_seed", "validation"}
        self.assertEqual(107, len(naming_output_names))
        self.assertEqual(107, len(self.definitions))
        self.assertEqual(set(self.definitions), set(self.validations))

        source = (REPOSITORY / "main.tf").read_text(encoding="utf-8")
        self.assertEqual(107, sum("name_unique =" in line for line in source.splitlines()))
        self.assertNotIn("suffix_unique", source)

    def test_every_unique_name_reserves_the_complete_suffix(self) -> None:
        for path, definition in self.definitions.items():
            with self.subTest(output=".".join(path)):
                name = definition["name"]
                name_unique = definition["name_unique"]
                minimum = definition["min_length"]
                maximum = definition["max_length"]

                self.assertIsInstance(name, str)
                self.assertIsInstance(name_unique, str)
                self.assertNotEqual(name, name_unique)
                self.assertTrue(name_unique.endswith(TOKEN), name_unique)
                self.assertGreaterEqual(len(name_unique), minimum)
                self.assertLessEqual(len(name_unique), maximum)
                self.assertEqual(maximum, len(name_unique))

    def test_every_generated_name_passes_the_published_validation(self) -> None:
        for path, result in self.validations.items():
            with self.subTest(output=".".join(path)):
                self.assertEqual(VALIDATION_KEYS, set(result))
                self.assertTrue(result["valid_name"])
                self.assertTrue(result["valid_name_unique"])

    def test_every_branch_is_a_valid_git_ref(self) -> None:
        branch_definitions = {
            path: definition
            for path, definition in self.definitions.items()
            if path[0] == "git_repository_branch" or "_branch_" in path[0]
        }
        self.assertEqual(17, len(branch_definitions))

        for path, definition in branch_definitions.items():
            for field in ("name", "name_unique"):
                candidate = definition[field]
                with self.subTest(output=".".join(path), field=field):
                    result = subprocess.run(
                        ["git", "check-ref-format", "--branch", candidate],
                        cwd=REPOSITORY,
                        capture_output=True,
                        text=True,
                    )
                    self.assertEqual(0, result.returncode, result.stderr)
                    if path[0].endswith("_dash"):
                        self.assertNotIn("/", candidate)
                    if path[0].endswith("_slash"):
                        self.assertIn("/", candidate)


if __name__ == "__main__":
    unittest.main()
