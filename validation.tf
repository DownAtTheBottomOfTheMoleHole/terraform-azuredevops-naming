# purpose: Define validation rules for generated names

locals {

  # Validation rules for names
  validation = {

    agent_pool = {
      valid_name        = length(regexall(local.azdo.agent_pool.regex, local.azdo.agent_pool.name)) > 0 && length(local.azdo.agent_pool.name) > local.azdo.agent_pool.min_length
      valid_name_unique = length(regexall(local.azdo.agent_pool.regex, local.azdo.agent_pool.name_unique)) > 0
    }

    branch_policy_build_validation = {
      valid_name        = length(regexall(local.azdo.branch_policy_build_validation.regex, local.azdo.branch_policy_build_validation.name)) > 0 && length(local.azdo.branch_policy_build_validation.name) > local.azdo.branch_policy_build_validation.min_length
      valid_name_unique = length(regexall(local.azdo.branch_policy_build_validation.regex, local.azdo.branch_policy_build_validation.name_unique)) > 0
    }

    build_definition = {
      valid_name        = length(regexall(local.azdo.build_definition.regex, local.azdo.build_definition.name)) > 0 && length(local.azdo.build_definition.name) > local.azdo.build_definition.min_length
      valid_name_unique = length(regexall(local.azdo.build_definition.regex, local.azdo.build_definition.name_unique)) > 0
    }

    elastic_pool = {
      valid_name        = length(regexall(local.azdo.elastic_pool.regex, local.azdo.elastic_pool.name)) > 0 && length(local.azdo.elastic_pool.name) > local.azdo.elastic_pool.min_length
      valid_name_unique = length(regexall(local.azdo.elastic_pool.regex, local.azdo.elastic_pool.name_unique)) > 0
    }

    environment = {
      valid_name        = length(regexall(local.azdo.environment.regex, local.azdo.environment.name)) > 0 && length(local.azdo.environment.name) > local.azdo.environment.min_length
      valid_name_unique = length(regexall(local.azdo.environment.regex, local.azdo.environment.name_unique)) > 0
    }

    git_repository = {
      valid_name        = length(regexall(local.azdo.git_repository.regex, local.azdo.git_repository.name)) > 0 && length(local.azdo.git_repository.name) > local.azdo.git_repository.min_length
      valid_name_unique = length(regexall(local.azdo.git_repository.regex, local.azdo.git_repository.name_unique)) > 0
    }

    git_repository_branch = {
      valid_name        = length(regexall(local.azdo.git_repository_branch.regex, local.azdo.git_repository_branch.name)) > 0 && length(local.azdo.git_repository_branch.name) > local.azdo.git_repository_branch.min_length
      valid_name_unique = length(regexall(local.azdo.git_repository_branch.regex, local.azdo.git_repository_branch.name_unique)) > 0
    }

    group = {
      valid_name        = length(regexall(local.azdo.group.regex, local.azdo.group.name)) > 0 && length(local.azdo.group.name) > local.azdo.group.min_length
      valid_name_unique = length(regexall(local.azdo.group.regex, local.azdo.group.name_unique)) > 0
    }

    project = {
      valid_name        = length(regexall(local.azdo.project.regex, local.azdo.project.name)) > 0 && length(local.azdo.project.name) > local.azdo.project.min_length
      valid_name_unique = length(regexall(local.azdo.project.regex, local.azdo.project.name_unique)) > 0
    }

    serviceendpoint_argocd = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_argocd.regex, local.azdo.serviceendpoint_argocd.name)) > 0 && length(local.azdo.serviceendpoint_argocd.name) > local.azdo.serviceendpoint_argocd.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_argocd.regex, local.azdo.serviceendpoint_argocd.name_unique)) > 0
    }

    serviceendpoint_artifactory = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_artifactory.regex, local.azdo.serviceendpoint_artifactory.name)) > 0 && length(local.azdo.serviceendpoint_artifactory.name) > local.azdo.serviceendpoint_artifactory.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_artifactory.regex, local.azdo.serviceendpoint_artifactory.name_unique)) > 0
    }

    serviceendpoint_aws = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_aws.regex, local.azdo.serviceendpoint_aws.name)) > 0 && length(local.azdo.serviceendpoint_aws.name) > local.azdo.serviceendpoint_aws.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_aws.regex, local.azdo.serviceendpoint_aws.name_unique)) > 0
    }

    serviceendpoint_azurecr = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_azurecr.regex, local.azdo.serviceendpoint_azurecr.name)) > 0 && length(local.azdo.serviceendpoint_azurecr.name) > local.azdo.serviceendpoint_azurecr.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_azurecr.regex, local.azdo.serviceendpoint_azurecr.name_unique)) > 0
    }

    serviceendpoint_azuredevops = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_azuredevops.regex, local.azdo.serviceendpoint_azuredevops.name)) > 0 && length(local.azdo.serviceendpoint_azuredevops.name) > local.azdo.serviceendpoint_azuredevops.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_azuredevops.regex, local.azdo.serviceendpoint_azuredevops.name_unique)) > 0
    }

    serviceendpoint_azurerm = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_azurerm.regex, local.azdo.serviceendpoint_azurerm.name)) > 0 && length(local.azdo.serviceendpoint_azurerm.name) > local.azdo.serviceendpoint_azurerm.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_azurerm.regex, local.azdo.serviceendpoint_azurerm.name_unique)) > 0
    }

    serviceendpoint_bitbucket = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_bitbucket.regex, local.azdo.serviceendpoint_bitbucket.name)) > 0 && length(local.azdo.serviceendpoint_bitbucket.name) > local.azdo.serviceendpoint_bitbucket.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_bitbucket.regex, local.azdo.serviceendpoint_bitbucket.name_unique)) > 0
    }

    serviceendpoint_dockerregistry = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_dockerregistry.regex, local.azdo.serviceendpoint_dockerregistry.name)) > 0 && length(local.azdo.serviceendpoint_dockerregistry.name) > local.azdo.serviceendpoint_dockerregistry.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_dockerregistry.regex, local.azdo.serviceendpoint_dockerregistry.name_unique)) > 0
    }

    serviceendpoint_externaltfs = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_externaltfs.regex, local.azdo.serviceendpoint_externaltfs.name)) > 0 && length(local.azdo.serviceendpoint_externaltfs.name) > local.azdo.serviceendpoint_externaltfs.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_externaltfs.regex, local.azdo.serviceendpoint_externaltfs.name_unique)) > 0
    }

    serviceendpoint_gcp_terraform = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_gcp_terraform.regex, local.azdo.serviceendpoint_gcp_terraform.name)) > 0 && length(local.azdo.serviceendpoint_gcp_terraform.name) > local.azdo.serviceendpoint_gcp_terraform.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_gcp_terraform.regex, local.azdo.serviceendpoint_gcp_terraform.name_unique)) > 0
    }

    serviceendpoint_generic = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_generic.regex, local.azdo.serviceendpoint_generic.name)) > 0 && length(local.azdo.serviceendpoint_generic.name) > local.azdo.serviceendpoint_generic.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_generic.regex, local.azdo.serviceendpoint_generic.name_unique)) > 0
    }

    serviceendpoint_generic_git = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_generic_git.regex, local.azdo.serviceendpoint_generic_git.name)) > 0 && length(local.azdo.serviceendpoint_generic_git.name) > local.azdo.serviceendpoint_generic_git.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_generic_git.regex, local.azdo.serviceendpoint_generic_git.name_unique)) > 0
    }

    serviceendpoint_github = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_github.regex, local.azdo.serviceendpoint_github.name)) > 0 && length(local.azdo.serviceendpoint_github.name) > local.azdo.serviceendpoint_github.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_github.regex, local.azdo.serviceendpoint_github.name_unique)) > 0
    }

    serviceendpoint_github_enterprise = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_github_enterprise.regex, local.azdo.serviceendpoint_github_enterprise.name)) > 0 && length(local.azdo.serviceendpoint_github_enterprise.name) > local.azdo.serviceendpoint_github_enterprise.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_github_enterprise.regex, local.azdo.serviceendpoint_github_enterprise.name_unique)) > 0
    }

    serviceendpoint_incomingwebhook = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_incomingwebhook.regex, local.azdo.serviceendpoint_incomingwebhook.name)) > 0 && length(local.azdo.serviceendpoint_incomingwebhook.name) > local.azdo.serviceendpoint_incomingwebhook.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_incomingwebhook.regex, local.azdo.serviceendpoint_incomingwebhook.name_unique)) > 0
    }

    serviceendpoint_jenkins = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_jenkins.regex, local.azdo.serviceendpoint_jenkins.name)) > 0 && length(local.azdo.serviceendpoint_jenkins.name) > local.azdo.serviceendpoint_jenkins.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_jenkins.regex, local.azdo.serviceendpoint_jenkins.name_unique)) > 0
    }

    serviceendpoint_jfrog_artifactory_v2 = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_jfrog_artifactory_v2.regex, local.azdo.serviceendpoint_jfrog_artifactory_v2.name)) > 0 && length(local.azdo.serviceendpoint_jfrog_artifactory_v2.name) > local.azdo.serviceendpoint_jfrog_artifactory_v2.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_jfrog_artifactory_v2.regex, local.azdo.serviceendpoint_jfrog_artifactory_v2.name_unique)) > 0
    }

    serviceendpoint_jfrog_distribution_v2 = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_jfrog_distribution_v2.regex, local.azdo.serviceendpoint_jfrog_distribution_v2.name)) > 0 && length(local.azdo.serviceendpoint_jfrog_distribution_v2.name) > local.azdo.serviceendpoint_jfrog_distribution_v2.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_jfrog_distribution_v2.regex, local.azdo.serviceendpoint_jfrog_distribution_v2.name_unique)) > 0
    }

    serviceendpoint_jfrog_platform_v2 = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_jfrog_platform_v2.regex, local.azdo.serviceendpoint_jfrog_platform_v2.name)) > 0 && length(local.azdo.serviceendpoint_jfrog_platform_v2.name) > local.azdo.serviceendpoint_jfrog_platform_v2.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_jfrog_platform_v2.regex, local.azdo.serviceendpoint_jfrog_platform_v2.name_unique)) > 0
    }

    serviceendpoint_jfrog_xray_v2 = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_jfrog_xray_v2.regex, local.azdo.serviceendpoint_jfrog_xray_v2.name)) > 0 && length(local.azdo.serviceendpoint_jfrog_xray_v2.name) > local.azdo.serviceendpoint_jfrog_xray_v2.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_jfrog_xray_v2.regex, local.azdo.serviceendpoint_jfrog_xray_v2.name_unique)) > 0
    }

    serviceendpoint_kubernetes = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_kubernetes.regex, local.azdo.serviceendpoint_kubernetes.name)) > 0 && length(local.azdo.serviceendpoint_kubernetes.name) > local.azdo.serviceendpoint_kubernetes.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_kubernetes.regex, local.azdo.serviceendpoint_kubernetes.name_unique)) > 0
    }

    serviceendpoint_maven = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_maven.regex, local.azdo.serviceendpoint_maven.name)) > 0 && length(local.azdo.serviceendpoint_maven.name) > local.azdo.serviceendpoint_maven.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_maven.regex, local.azdo.serviceendpoint_maven.name_unique)) > 0
    }

    serviceendpoint_nexus = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_nexus.regex, local.azdo.serviceendpoint_nexus.name)) > 0 && length(local.azdo.serviceendpoint_nexus.name) > local.azdo.serviceendpoint_nexus.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_nexus.regex, local.azdo.serviceendpoint_nexus.name_unique)) > 0
    }

    serviceendpoint_npm = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_npm.regex, local.azdo.serviceendpoint_npm.name)) > 0 && length(local.azdo.serviceendpoint_npm.name) > local.azdo.serviceendpoint_npm.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_npm.regex, local.azdo.serviceendpoint_npm.name_unique)) > 0
    }

    serviceendpoint_nuget = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_nuget.regex, local.azdo.serviceendpoint_nuget.name)) > 0 && length(local.azdo.serviceendpoint_nuget.name) > local.azdo.serviceendpoint_nuget.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_nuget.regex, local.azdo.serviceendpoint_nuget.name_unique)) > 0
    }

    serviceendpoint_octopusdeploy = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_octopusdeploy.regex, local.azdo.serviceendpoint_octopusdeploy.name)) > 0 && length(local.azdo.serviceendpoint_octopusdeploy.name) > local.azdo.serviceendpoint_octopusdeploy.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_octopusdeploy.regex, local.azdo.serviceendpoint_octopusdeploy.name_unique)) > 0
    }

    serviceendpoint_runpipeline = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_runpipeline.regex, local.azdo.serviceendpoint_runpipeline.name)) > 0 && length(local.azdo.serviceendpoint_runpipeline.name) > local.azdo.serviceendpoint_runpipeline.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_runpipeline.regex, local.azdo.serviceendpoint_runpipeline.name_unique)) > 0
    }

    serviceendpoint_servicefabric = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_servicefabric.regex, local.azdo.serviceendpoint_servicefabric.name)) > 0 && length(local.azdo.serviceendpoint_servicefabric.name) > local.azdo.serviceendpoint_servicefabric.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_servicefabric.regex, local.azdo.serviceendpoint_servicefabric.name_unique)) > 0
    }

    serviceendpoint_sonarcloud = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_sonarcloud.regex, local.azdo.serviceendpoint_sonarcloud.name)) > 0 && length(local.azdo.serviceendpoint_sonarcloud.name) > local.azdo.serviceendpoint_sonarcloud.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_sonarcloud.regex, local.azdo.serviceendpoint_sonarcloud.name_unique)) > 0
    }

    serviceendpoint_sonarqube = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_sonarqube.regex, local.azdo.serviceendpoint_sonarqube.name)) > 0 && length(local.azdo.serviceendpoint_sonarqube.name) > local.azdo.serviceendpoint_sonarqube.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_sonarqube.regex, local.azdo.serviceendpoint_sonarqube.name_unique)) > 0
    }

    serviceendpoint_ssh = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_ssh.regex, local.azdo.serviceendpoint_ssh.name)) > 0 && length(local.azdo.serviceendpoint_ssh.name) > local.azdo.serviceendpoint_ssh.min_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_ssh.regex, local.azdo.serviceendpoint_ssh.name_unique)) > 0
    }


    team = {
      valid_name        = length(regexall(local.azdo.team.regex, local.azdo.team.name)) > 0 && length(local.azdo.team.name) > local.azdo.team.min_length
      valid_name_unique = length(regexall(local.azdo.team.regex, local.azdo.team.name_unique)) > 0
    }

    variable_group = {
      valid_name        = length(regexall(local.azdo.variable_group.regex, local.azdo.variable_group.name)) > 0 && length(local.azdo.variable_group.name) > local.azdo.variable_group.min_length
      valid_name_unique = length(regexall(local.azdo.variable_group.regex, local.azdo.variable_group.name_unique)) > 0
    }

  }
}
