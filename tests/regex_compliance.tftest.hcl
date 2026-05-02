# Regex compliance
# Walks every top-level (non-collection) output and asserts that the generated
# name matches its declared regex. Iterating outputs at runtime isn't possible
# in terraform test, so this enumerates the keys explicitly. Add new entries
# here whenever a new key is added to local.azdo.

variables {
  prefix = ["dbmh"]
  suffix = ["v11"]
}

run "every_simple_output_matches_its_regex" {
  command = apply

  assert {
    condition = alltrue([
      length(regexall(output.agent_pool.regex, output.agent_pool.name)) > 0,
      length(regexall(output.branch_policy_build_validation.regex, output.branch_policy_build_validation.name)) > 0,
      length(regexall(output.build_definition.regex, output.build_definition.name)) > 0,
      length(regexall(output.build_folder.regex, output.build_folder.name)) > 0,
      length(regexall(output.elastic_pool.regex, output.elastic_pool.name)) > 0,
      length(regexall(output.git_repository.regex, output.git_repository.name)) > 0,
      length(regexall(output.git_repository_branch.regex, output.git_repository_branch.name)) > 0,
      length(regexall(output.group.regex, output.group.name)) > 0,
      length(regexall(output.project.regex, output.project.name)) > 0,
      length(regexall(output.team.regex, output.team.name)) > 0,
      length(regexall(output.variable_group.regex, output.variable_group.name)) > 0,
    ])
    error_message = "One or more core outputs failed regex compliance — inspect outputs vs their declared regex"
  }
}

run "every_simple_output_matches_its_regex_unique" {
  command = apply

  assert {
    condition = alltrue([
      length(regexall(output.agent_pool.regex, output.agent_pool.name_unique)) > 0,
      length(regexall(output.branch_policy_build_validation.regex, output.branch_policy_build_validation.name_unique)) > 0,
      length(regexall(output.build_definition.regex, output.build_definition.name_unique)) > 0,
      length(regexall(output.build_folder.regex, output.build_folder.name_unique)) > 0,
      length(regexall(output.elastic_pool.regex, output.elastic_pool.name_unique)) > 0,
      length(regexall(output.git_repository.regex, output.git_repository.name_unique)) > 0,
      length(regexall(output.git_repository_branch.regex, output.git_repository_branch.name_unique)) > 0,
      length(regexall(output.group.regex, output.group.name_unique)) > 0,
      length(regexall(output.project.regex, output.project.name_unique)) > 0,
      length(regexall(output.team.regex, output.team.name_unique)) > 0,
      length(regexall(output.variable_group.regex, output.variable_group.name_unique)) > 0,
    ])
    error_message = "One or more core outputs failed regex compliance for name_unique"
  }
}

run "every_serviceendpoint_matches_its_regex" {
  command = apply

  assert {
    condition = alltrue([
      length(regexall(output.serviceendpoint_argocd.regex, output.serviceendpoint_argocd.name)) > 0,
      length(regexall(output.serviceendpoint_artifactory.regex, output.serviceendpoint_artifactory.name)) > 0,
      length(regexall(output.serviceendpoint_aws.regex, output.serviceendpoint_aws.name)) > 0,
      length(regexall(output.serviceendpoint_azurecr.regex, output.serviceendpoint_azurecr.name)) > 0,
      length(regexall(output.serviceendpoint_azuredevops.regex, output.serviceendpoint_azuredevops.name)) > 0,
      length(regexall(output.serviceendpoint_azurerm.regex, output.serviceendpoint_azurerm.name)) > 0,
      length(regexall(output.serviceendpoint_bitbucket.regex, output.serviceendpoint_bitbucket.name)) > 0,
      length(regexall(output.serviceendpoint_dockerregistry.regex, output.serviceendpoint_dockerregistry.name)) > 0,
      length(regexall(output.serviceendpoint_externaltfs.regex, output.serviceendpoint_externaltfs.name)) > 0,
      length(regexall(output.serviceendpoint_gcp_terraform.regex, output.serviceendpoint_gcp_terraform.name)) > 0,
      length(regexall(output.serviceendpoint_generic.regex, output.serviceendpoint_generic.name)) > 0,
      length(regexall(output.serviceendpoint_generic_git.regex, output.serviceendpoint_generic_git.name)) > 0,
      length(regexall(output.serviceendpoint_github.regex, output.serviceendpoint_github.name)) > 0,
      length(regexall(output.serviceendpoint_github_enterprise.regex, output.serviceendpoint_github_enterprise.name)) > 0,
      length(regexall(output.serviceendpoint_incomingwebhook.regex, output.serviceendpoint_incomingwebhook.name)) > 0,
      length(regexall(output.serviceendpoint_jenkins.regex, output.serviceendpoint_jenkins.name)) > 0,
      length(regexall(output.serviceendpoint_jfrog_artifactory_v2.regex, output.serviceendpoint_jfrog_artifactory_v2.name)) > 0,
      length(regexall(output.serviceendpoint_jfrog_distribution_v2.regex, output.serviceendpoint_jfrog_distribution_v2.name)) > 0,
      length(regexall(output.serviceendpoint_jfrog_platform_v2.regex, output.serviceendpoint_jfrog_platform_v2.name)) > 0,
      length(regexall(output.serviceendpoint_jfrog_xray_v2.regex, output.serviceendpoint_jfrog_xray_v2.name)) > 0,
      length(regexall(output.serviceendpoint_kubernetes.regex, output.serviceendpoint_kubernetes.name)) > 0,
      length(regexall(output.serviceendpoint_maven.regex, output.serviceendpoint_maven.name)) > 0,
      length(regexall(output.serviceendpoint_nexus.regex, output.serviceendpoint_nexus.name)) > 0,
      length(regexall(output.serviceendpoint_npm.regex, output.serviceendpoint_npm.name)) > 0,
      length(regexall(output.serviceendpoint_nuget.regex, output.serviceendpoint_nuget.name)) > 0,
      length(regexall(output.serviceendpoint_octopusdeploy.regex, output.serviceendpoint_octopusdeploy.name)) > 0,
      length(regexall(output.serviceendpoint_runpipeline.regex, output.serviceendpoint_runpipeline.name)) > 0,
      length(regexall(output.serviceendpoint_servicefabric.regex, output.serviceendpoint_servicefabric.name)) > 0,
      length(regexall(output.serviceendpoint_sonarcloud.regex, output.serviceendpoint_sonarcloud.name)) > 0,
      length(regexall(output.serviceendpoint_sonarqube.regex, output.serviceendpoint_sonarqube.name)) > 0,
      length(regexall(output.serviceendpoint_ssh.regex, output.serviceendpoint_ssh.name)) > 0,
    ])
    error_message = "One or more service endpoint outputs failed regex compliance"
  }
}
