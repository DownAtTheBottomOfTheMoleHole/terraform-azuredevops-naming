# Authoritative Azure DevOps metadata and validation contracts

run "corrected_limits_and_scopes_are_published" {
  command = apply

  variables {
    prefix      = ["valid"]
    suffix      = ["name"]
    unique_seed = "u9x7"
  }

  assert {
    condition = alltrue([
      output.git_repository_branch.max_length == 250,
      output.team.max_length == 64,
      output.organization.max_length == 49,
      output.pipeline_matrix.max_length == 100,
      output.build_folder.scope == "Project",
      output.organization.scope == "Global",
      output.feed.scope == "Project or Organization",
      output.group.scope == "Project or Organization",
      output.workitemtrackingprocess_process.scope == "Organization",
      output.workitemtrackingprocess_field.scope == "Organization",
    ])
    error_message = "Published naming limits and uniqueness scopes must match the Azure DevOps contracts"
  }
}

run "pipeline_identifiers_use_identifier_safe_separators" {
  command = apply

  variables {
    prefix      = ["build", "linux"]
    suffix      = ["release"]
    unique_seed = "u9x7"
  }

  assert {
    condition = alltrue([
      output.pipeline_stage.name == "build_linux_release",
      output.pipeline_job.name == "build_linux_release",
      output.pipeline_variable.name == "build_linux_release",
      output.variable_group_variable.name == "build_linux_release",
      output.pipeline_matrix.name == "build_linux_release",
    ])
    error_message = "Pipeline identifiers must be composed with underscores"
  }

  assert {
    condition = alltrue([
      output.validation.pipeline_stage.valid_name,
      output.validation.pipeline_job.valid_name,
      output.validation.pipeline_variable.valid_name,
      output.validation.variable_group_variable.valid_name,
      output.validation.pipeline_matrix.valid_name,
    ])
    error_message = "Identifier-safe generated pipeline names must pass validation"
  }
}

run "environment_work_item_validation_has_the_standard_shape" {
  command = apply

  variables {
    environment_tags = ["dev"]
    prefix           = ["valid"]
    unique_seed      = "u9x7"
    work_items       = ["1234"]
  }

  assert {
    condition = toset(keys(output.validation.environment_work_item["development"]["1234"])) == toset([
      "valid_name",
      "valid_name_unique",
    ])
    error_message = "environment_work_item validation must expose only the two standard boolean fields"
  }

  assert {
    condition = alltrue([
      output.validation.environment_work_item["development"]["1234"].valid_name,
      output.validation.environment_work_item["development"]["1234"].valid_name_unique,
    ])
    error_message = "The environment work-item validation fields must contain usable booleans"
  }
}

run "organization_accepts_a_single_alphanumeric_character" {
  command = apply

  variables {
    prefix        = ["a"]
    suffix        = []
    unique_length = 0
  }

  assert {
    condition     = output.validation.organization.valid_name
    error_message = "A one-character alphanumeric organization name is valid"
  }
}

run "project_allows_documented_internal_characters" {
  command = apply

  variables {
    prefix        = ["valid.name_~&%@"]
    suffix        = []
    unique_length = 0
  }

  assert {
    condition     = output.validation.project.valid_name
    error_message = "Project validation must allow documented internal punctuation while enforcing boundary rules separately"
  }
}

run "reserved_and_hidden_url_names_are_rejected" {
  command = apply

  variables {
    prefix        = ["App_Data"]
    suffix        = []
    unique_length = 0
  }

  assert {
    condition     = !output.validation.project.valid_name
    error_message = "IIS hidden path segments must not be accepted as project names"
  }
}

run "system_reserved_names_are_rejected" {
  command = apply

  variables {
    prefix        = ["NUL"]
    suffix        = []
    unique_length = 0
  }

  assert {
    condition = alltrue([
      !output.validation.git_repository.valid_name,
      !output.validation.project.valid_name,
      !output.validation.team.valid_name,
      !output.validation.area_path.valid_name,
      !output.validation.iteration_path.valid_name,
    ])
    error_message = "Documented system-reserved names must be rejected by URL and work-tree naming contracts"
  }
}

run "group_names_must_not_end_in_a_period" {
  command = apply

  variables {
    prefix        = ["valid."]
    suffix        = []
    unique_length = 0
  }

  assert {
    condition = alltrue([
      !output.validation.group.valid_name,
      !output.validation.security_group.valid_name,
    ])
    error_message = "Security group account names must not end in a period"
  }
}

run "artifact_package_separators_must_not_be_consecutive" {
  command = apply

  variables {
    prefix        = ["valid..package"]
    suffix        = []
    unique_length = 0
  }

  assert {
    condition     = !output.validation.artifact_package.valid_name
    error_message = "Artifact package names must reject consecutive separator characters"
  }
}
