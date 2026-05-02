# Length boundary testing
# Verifies that very long inputs are correctly truncated to per-resource limits.
# This protects consumers from accidentally generating names that would be
# rejected at runtime by the Azure DevOps API.

variables {
  # 100 chars combined — guaranteed to overflow project (64) and git_repository (64)
  prefix = ["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"]
  suffix = ["bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"]
}

run "project_name_truncated_to_64" {
  command = apply

  assert {
    condition     = length(output.project.name) == 64
    error_message = "project.name must be truncated to exactly 64 chars; got length ${length(output.project.name)}"
  }
}

run "git_repository_name_truncated_to_64" {
  command = apply

  assert {
    condition     = length(output.git_repository.name) == 64
    error_message = "git_repository.name must be truncated to exactly 64 chars; got length ${length(output.git_repository.name)}"
  }
}

run "all_outputs_respect_their_max_length" {
  command = apply

  assert {
    condition = alltrue([
      length(output.project.name) <= output.project.max_length,
      length(output.project.name_unique) <= output.project.max_length,
      length(output.git_repository.name) <= output.git_repository.max_length,
      length(output.git_repository.name_unique) <= output.git_repository.max_length,
      length(output.git_repository_branch.name) <= output.git_repository_branch.max_length,
      length(output.team.name) <= output.team.max_length,
      length(output.variable_group.name) <= output.variable_group.max_length,
      length(output.group.name) <= output.group.max_length,
      length(output.agent_pool.name) <= output.agent_pool.max_length,
      length(output.build_definition.name) <= output.build_definition.max_length,
      length(output.build_folder.name) <= output.build_folder.max_length,
      length(output.elastic_pool.name) <= output.elastic_pool.max_length,
      length(output.serviceendpoint_azurerm.name) <= output.serviceendpoint_azurerm.max_length,
      length(output.serviceendpoint_github.name) <= output.serviceendpoint_github.max_length,
      length(output.serviceendpoint_kubernetes.name) <= output.serviceendpoint_kubernetes.max_length,
    ])
    error_message = "One or more outputs exceeded their declared max_length when given oversized inputs"
  }
}
