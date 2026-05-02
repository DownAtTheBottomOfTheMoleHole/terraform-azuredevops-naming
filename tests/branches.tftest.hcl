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
    ])
    error_message = "Every slash branch variant must produce one entry per work_item (expected 2 each)"
  }
}
