# Validation flags
# Verifies that, for representative inputs, every name produced by the module
# satisfies its declared regex and length constraints. The module exposes a
# parallel `validation` map but does not expose it as an output today; we rely
# on the per-resource scope by checking representative outputs against their
# own regex/min_length/max_length.

variables {
  prefix     = ["dbmh"]
  suffix     = ["v11"]
  work_items = ["1234"]
}

run "core_outputs_match_their_regex" {
  command = apply

  assert {
    condition     = length(regexall(output.project.regex, output.project.name)) > 0
    error_message = "project.name '${output.project.name}' must match its declared regex"
  }

  assert {
    condition     = length(regexall(output.git_repository.regex, output.git_repository.name)) > 0
    error_message = "git_repository.name '${output.git_repository.name}' must match its declared regex"
  }

  assert {
    condition     = length(regexall(output.team.regex, output.team.name)) > 0
    error_message = "team.name '${output.team.name}' must match its declared regex"
  }

  assert {
    condition     = length(regexall(output.variable_group.regex, output.variable_group.name)) > 0
    error_message = "variable_group.name '${output.variable_group.name}' must match its declared regex"
  }

  assert {
    condition     = length(regexall(output.group.regex, output.group.name)) > 0
    error_message = "group.name '${output.group.name}' must match its declared regex"
  }

  assert {
    condition     = length(regexall(output.agent_pool.regex, output.agent_pool.name)) > 0
    error_message = "agent_pool.name '${output.agent_pool.name}' must match its declared regex"
  }

  assert {
    condition     = length(regexall(output.build_definition.regex, output.build_definition.name)) > 0
    error_message = "build_definition.name '${output.build_definition.name}' must match its declared regex"
  }
}

run "core_outputs_respect_max_length" {
  command = apply

  assert {
    condition     = length(output.project.name) <= output.project.max_length
    error_message = "project.name length ${length(output.project.name)} exceeds max_length ${output.project.max_length}"
  }

  assert {
    condition     = length(output.project.name_unique) <= output.project.max_length
    error_message = "project.name_unique length ${length(output.project.name_unique)} exceeds max_length ${output.project.max_length}"
  }

  assert {
    condition     = length(output.git_repository.name) <= output.git_repository.max_length
    error_message = "git_repository.name exceeds max_length"
  }

  assert {
    condition     = length(output.team.name) <= output.team.max_length
    error_message = "team.name exceeds max_length"
  }

  assert {
    condition     = length(output.variable_group.name) <= output.variable_group.max_length
    error_message = "variable_group.name exceeds max_length"
  }
}

run "service_endpoints_match_their_regex" {
  command = apply

  assert {
    condition     = length(regexall(output.serviceendpoint_azurerm.regex, output.serviceendpoint_azurerm.name)) > 0
    error_message = "serviceendpoint_azurerm.name must match its regex"
  }

  assert {
    condition     = length(regexall(output.serviceendpoint_github.regex, output.serviceendpoint_github.name)) > 0
    error_message = "serviceendpoint_github.name must match its regex"
  }

  assert {
    condition     = length(regexall(output.serviceendpoint_kubernetes.regex, output.serviceendpoint_kubernetes.name)) > 0
    error_message = "serviceendpoint_kubernetes.name must match its regex"
  }
}
