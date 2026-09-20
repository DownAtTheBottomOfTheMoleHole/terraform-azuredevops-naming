## Summary

<!-- Explain what changed and why. Keep the pull request focused. -->

## Related issue

<!-- Use "Closes #123" where appropriate, or write "None". -->

## Public interface and compatibility

<!-- List affected inputs, outputs, naming metadata, examples, or workflow behaviour. State explicitly when none are affected. -->

- Affected inputs:
- Affected outputs:
- Compatibility or migration notes:

## Validation

<!-- Check the commands you ran. Explain any item that is not applicable. -->

- [ ] `terraform fmt -check -recursive`
- [ ] `terraform init -backend=false -input=false`
- [ ] `terraform validate`
- [ ] `terraform test -verbose`
- [ ] `pre-commit run --all-files`
- [ ] Generated Terraform documentation was committed, or source changes do not affect it

Additional test evidence or exceptions:

## Release impact

Every merge to `main` creates a release. Select one increment and apply the indicated label before merge:

- [ ] Patch (default; no module-release label)
- [ ] Minor (`module-release:minor`)
- [ ] Major (`module-release:major`)

<!-- Explain the release choice, especially for a major-version change. -->

## Security and automation review

- [ ] This change does not add or broaden token permissions, secrets, privileged triggers, or mutable action references
- [ ] Any security-sensitive workflow change is explained below and uses least privilege
- [ ] Third-party actions and reusable workflows are pinned to a full commit SHA

Security or automation notes:

## Documentation

<!-- Link updated guidance, changelog entries, screenshots, plans, or generated output when useful. -->
