"""Regression tests for the security-critical release workflow glue."""

from __future__ import annotations

from pathlib import Path
import unittest


ROOT = Path(__file__).parents[1]
RELEASE_WORKFLOW = ROOT / ".github" / "workflows" / "release.yml"


def step(workflow: str, name: str, next_name: str | None = None) -> str:
    """Return one named workflow step without requiring a YAML dependency."""

    start_marker = f"      - name: {name}\n"
    start = workflow.index(start_marker)
    if next_name is None:
        return workflow[start:]
    end_marker = f"      - name: {next_name}\n"
    end = workflow.index(end_marker, start + len(start_marker))
    return workflow[start:end]


class ReleaseWorkflowContractTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.workflow = RELEASE_WORKFLOW.read_text(encoding="utf-8")

    def test_plan_is_created_before_it_is_read(self) -> None:
        body = step(self.workflow, "Build release plan", "Setup Terraform")

        create = body.index("python3 scripts/release_plan.py")
        read_plan = body.index('plan_json="$(tr -d')
        read_items = body.index("item_count=\"$(jq")
        self.assertLess(create, read_plan)
        self.assertLess(create, read_items)

    def test_validation_materialises_release_shas_fail_closed(self) -> None:
        body = step(
            self.workflow,
            "Validate every planned commit",
            "⬇️ Checkout release target",
        )

        materialise = body.index("jq -r '.items[].sha'")
        validate = body.index("while IFS= read -r release_sha")
        consume = body.index('done < "$release_shas_file"')
        self.assertLess(materialise, validate)
        self.assertLess(validate, consume)
        self.assertNotIn("done < <(", body)

    def test_release_examples_validate_the_selected_local_module(self) -> None:
        body = step(
            self.workflow,
            "Validate every planned commit",
            "⬇️ Checkout release target",
        )

        self.assertIn('python3 scripts/validate_example.py "$example_dir"', body)
        self.assertNotIn('terraform -chdir="$example_dir"', body)

    def test_publish_materialises_release_items_before_writes(self) -> None:
        body = step(self.workflow, "Create tags and GitHub releases")

        define = body.index('items_file="$RUNNER_TEMP/release-items.jsonl"')
        materialise = body.index("jq -c '.items[]'")
        publish = body.index("while IFS= read -r item")
        consume = body.index('done < "$items_file"')
        self.assertLess(define, materialise)
        self.assertLess(materialise, publish)
        self.assertLess(publish, consume)

    def test_every_checkout_disables_persisted_credentials(self) -> None:
        workflow_files = sorted((ROOT / ".github" / "workflows").glob("*.yml"))
        checkout_count = 0
        hardened_count = 0

        for workflow_file in workflow_files:
            workflow = workflow_file.read_text(encoding="utf-8")
            checkout_count += workflow.count("uses: actions/checkout@")
            hardened_count += workflow.count("persist-credentials: false")

        self.assertGreater(checkout_count, 0)
        self.assertEqual(checkout_count, hardened_count)

    def test_pull_request_checks_do_not_use_privileged_target_event(self) -> None:
        pull_request_workflow = (
            ROOT / ".github" / "workflows" / "pullrequest.yml"
        ).read_text(encoding="utf-8")

        self.assertNotIn("pull_request_target:", pull_request_workflow)


if __name__ == "__main__":
    unittest.main()
