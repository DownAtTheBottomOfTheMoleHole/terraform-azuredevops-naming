# Branch naming
# Verifies the dash vs slash variants of work-item-driven branch names
# (feature, bug, hotfix, release, etc.) and lowercase enforcement.

variables {
  prefix     = ["dbmh"]
  suffix     = ["test"]
  work_items = ["1234", "5678"]
}

run "feature_branch_dash_uses_hyphen_separator" {
  command = apply

  assert {
    condition     = startswith(output.git_repository_feature_branch_dash["1234"].name, "feature-1234")
    error_message = "Dash variant must use 'feature-<id>'; got: ${output.git_repository_feature_branch_dash["1234"].name}"
  }
}

run "feature_branch_slash_uses_slash_separator" {
  command = apply

  assert {
    condition     = startswith(output.git_repository_feature_branch_slash["1234"].name, "feature/1234")
    error_message = "Slash variant must use 'feature/<id>'; got: ${output.git_repository_feature_branch_slash["1234"].name}"
  }
}

run "all_branch_names_are_lowercased" {
  command = apply

  variables {
    prefix     = ["DBMH"]
    suffix     = ["TEST"]
    work_items = ["9999"]
  }

  assert {
    condition     = output.git_repository_feature_branch_dash["9999"].name == lower(output.git_repository_feature_branch_dash["9999"].name)
    error_message = "Branch names must be lowercased even when prefix/suffix are uppercase"
  }

  assert {
    condition     = output.git_repository_hotfix_branch_slash["9999"].name == lower(output.git_repository_hotfix_branch_slash["9999"].name)
    error_message = "Hotfix slash branch names must be lowercased"
  }
}

run "every_branch_variant_is_produced_per_work_item" {
  command = apply

  assert {
    condition = alltrue([
      length(output.git_repository_bug_branch_dash) == 2,
      length(output.git_repository_dev_branch_dash) == 2,
      length(output.git_repository_development_branch_dash) == 2,
      length(output.git_repository_feature_branch_dash) == 2,
      length(output.git_repository_fix_branch_dash) == 2,
      length(output.git_repository_hotfix_branch_dash) == 2,
      length(output.git_repository_release_branch_dash) == 2,
      length(output.git_repository_support_branch_dash) == 2,
    ])
    error_message = "Every dash branch variant must produce one entry per work_item (expected 2 each)"
  }

  assert {
    condition = alltrue([
      length(output.git_repository_bug_branch_slash) == 2,
      length(output.git_repository_dev_branch_slash) == 2,
      length(output.git_repository_development_branch_slash) == 2,
      length(output.git_repository_feature_branch_slash) == 2,
      length(output.git_repository_fix_branch_slash) == 2,
      length(output.git_repository_hotfix_branch_slash) == 2,
      length(output.git_repository_release_branch_slash) == 2,
      length(output.git_repository_support_branch_slash) == 2,
    ])
    error_message = "Every slash branch variant must produce one entry per work_item (expected 2 each)"
  }
}

run "every_branch_variant_passes_its_declared_validation" {
  command = apply

  assert {
    condition = alltrue(flatten([
      for variants in [
        output.validation.git_repository_bug_branch_dash,
        output.validation.git_repository_bug_branch_slash,
        output.validation.git_repository_dev_branch_dash,
        output.validation.git_repository_dev_branch_slash,
        output.validation.git_repository_development_branch_dash,
        output.validation.git_repository_development_branch_slash,
        output.validation.git_repository_feature_branch_dash,
        output.validation.git_repository_feature_branch_slash,
        output.validation.git_repository_fix_branch_dash,
        output.validation.git_repository_fix_branch_slash,
        output.validation.git_repository_hotfix_branch_dash,
        output.validation.git_repository_hotfix_branch_slash,
        output.validation.git_repository_release_branch_dash,
        output.validation.git_repository_release_branch_slash,
        output.validation.git_repository_support_branch_dash,
        output.validation.git_repository_support_branch_slash,
        ] : [
        for result in values(variants) : result.valid_name && result.valid_name_unique
      ]
    ]))
    error_message = "Every generated branch name must satisfy its declared validation metadata"
  }
}

run "dotted_hierarchical_refs_are_valid" {
  command = apply

  variables {
    prefix      = []
    suffix      = []
    work_items  = ["1.2.3"]
    unique_seed = "u9x7"
  }

  assert {
    condition     = output.validation.git_repository_release_branch_slash["1.2.3"].valid_name
    error_message = "A dotted hierarchical ref such as release/1.2.3 must be valid"
  }

  assert {
    condition     = output.git_repository_release_branch_slash["1.2.3"].name == "release/1.2.3"
    error_message = "The slash variant must preserve the dotted work-item component"
  }
}

run "dash_variants_reject_slashes_in_work_items" {
  command = apply

  variables {
    prefix      = []
    suffix      = []
    work_items  = ["nested/item"]
    unique_seed = "u9x7"
  }

  assert {
    condition     = !output.validation.git_repository_feature_branch_dash["nested/item"].valid_name
    error_message = "Dash-only branch variants must reject slash-bearing work items"
  }

  assert {
    condition     = output.validation.git_repository_feature_branch_slash["nested/item"].valid_name
    error_message = "Slash variants must permit structurally valid nested refs"
  }
}

run "invalid_git_ref_structures_are_rejected" {
  command = apply

  variables {
    prefix      = ["bad..name"]
    suffix      = []
    unique_seed = "u9x7"
  }

  assert {
    condition     = !output.validation.git_repository_branch.valid_name
    error_message = "Branches containing two consecutive periods must be rejected"
  }
}

run "repeated_and_trailing_slashes_are_rejected" {
  command = apply

  variables {
    prefix      = []
    suffix      = []
    work_items  = ["bad//name", "bad/"]
    unique_seed = "u9x7"
  }

  assert {
    condition     = !output.validation.git_repository_release_branch_slash["bad//name"].valid_name
    error_message = "Repeated slashes must be rejected"
  }

  assert {
    condition     = !output.validation.git_repository_release_branch_slash["bad/"].valid_name
    error_message = "An empty branch path component must be rejected"
  }
}

run "dot_prefixed_and_lock_components_are_rejected" {
  command = apply

  variables {
    prefix      = []
    suffix      = []
    work_items  = [".hidden", "name.lock", "bad@{name", "bad name"]
    unique_seed = "u9x7"
  }

  assert {
    condition = alltrue([
      !output.validation.git_repository_release_branch_slash[".hidden"].valid_name,
      !output.validation.git_repository_release_branch_slash["name.lock"].valid_name,
      !output.validation.git_repository_release_branch_slash["bad@{name"].valid_name,
      !output.validation.git_repository_release_branch_slash["bad name"].valid_name,
    ])
    error_message = "Git-invalid path components, reflog syntax, and spaces must be rejected"
  }
}
