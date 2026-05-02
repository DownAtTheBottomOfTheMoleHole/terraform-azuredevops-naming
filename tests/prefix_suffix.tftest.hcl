# Prefix and suffix composition
# Verifies that `prefix` and `suffix` inputs (both list(string)) are joined,
# placed in the correct order, and that empty list elements are stripped.

variables {
  prefix = ["dbmh", "platform"]
  suffix = ["uksouth", "001"]
}

run "prefix_suffix_appear_in_project_name" {
  command = apply

  assert {
    condition     = startswith(output.project.name, "dbmh-platform-")
    error_message = "project.name must start with 'dbmh-platform-'; got: ${output.project.name}"
  }

  assert {
    condition     = endswith(output.project.name, "-uksouth-001")
    error_message = "project.name must end with '-uksouth-001'; got: ${output.project.name}"
  }
}

run "git_repository_name_is_lowercased" {
  command = apply

  variables {
    prefix = ["DBMH", "Platform"]
    suffix = ["UKSouth", "001"]
  }

  assert {
    condition     = output.git_repository.name == lower(output.git_repository.name)
    error_message = "git_repository.name must be lowercased; got: ${output.git_repository.name}"
  }
}

run "empty_prefix_does_not_introduce_leading_separator" {
  command = apply

  variables {
    prefix = []
    suffix = ["uksouth"]
  }

  assert {
    condition     = !startswith(output.project.name, "-")
    error_message = "project.name must not start with a separator when prefix is empty; got: ${output.project.name}"
  }
}
