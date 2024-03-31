output "agent_pool" {
  description = "The agent pool used in Azure DevOps"
  sensitive   = false
  value       = local.azdo.agent_pool
}

output "branch_policy_build_validation" {
  description = "The display name of the branch policy for build validation in Azure DevOps"
  sensitive   = false
  value       = local.azdo.branch_policy_build_validation
}

output "build_definition" {
  description = "The build definition in Azure DevOps"
  sensitive   = false
  value       = local.azdo.build_definition
}

output "build_folder" {
  description = "The folder containing the build files in Azure DevOps"
  sensitive   = false
  value       = local.azdo.build_folder
}

output "elastic_pool" {
  description = "The elastic pool used in Azure DevOps"
  sensitive   = false
  value       = local.azdo.elastic_pool
}

output "environment" {
  description = "The name of the environment in Azure DevOps"
  sensitive   = false
  value       = local.azdo.environment
}

output "environment_apply" {
  description = "The name of the environment where apply operations are performed in Azure DevOps"
  sensitive   = false
  value       = local.azdo.environment_apply
}

output "environment_apply_basic" {
  description = "The basic name of the environment where apply operations are performed in Azure DevOps"
  sensitive   = false
  value       = local.azdo.environment_apply_basic
}

output "environment_basic" {
  description = "The basic name of the environment in Azure DevOps"
  sensitive   = false
  value       = local.azdo.environment_basic
}

output "environment_plan" {
  description = "The name of the environment where plan operations are performed in Azure DevOps"
  sensitive   = false
  value       = local.azdo.environment_plan
}

output "environment_plan_basic" {
  description = "The basic name of the environment where plan operations are performed in Azure DevOps"
  sensitive   = false
  value       = local.azdo.environment_plan_basic
}

output "environment_work_item" {
  description = "The name of the environment associated with work items in Azure DevOps"
  sensitive   = false
  value       = local.azdo.environment_work_item
}

output "environment_work_item_basic" {
  description = "The basic name of the environment associated with work items in Azure DevOps"
  sensitive   = false
  value       = local.azdo.environment_work_item_basic
}

output "git_repository" {
  description = "The Git repository in Azure DevOps"
  sensitive   = false
  value       = local.azdo.git_repository
}

output "git_repository_branch" {
  description = "The branch of the Git repository in Azure DevOps"
  sensitive   = false
  value       = local.azdo.git_repository_branch
}

output "git_repository_bug_branch_dash" {
  description = "The bug branch of the Git repository in Azure DevOps, with dashes"
  sensitive   = false
  value       = local.azdo.git_repository_bug_branch_dash
}

output "git_repository_bug_branch_slash" {
  description = "The bug branch of the Git repository in Azure DevOps, with slashes"
  sensitive   = false
  value       = local.azdo.git_repository_bug_branch_slash
}

output "git_repository_dev_branch_dash" {
  description = "The development branch of the Git repository in Azure DevOps, with dashes"
  sensitive   = false
  value       = local.azdo.git_repository_dev_branch_dash
}

output "git_repository_dev_branch_slash" {
  description = "The development branch of the Git repository in Azure DevOps, with slashes"
  sensitive   = false
  value       = local.azdo.git_repository_dev_branch_slash
}

output "git_repository_development_branch_dash" {
  description = "The development branch of the Git repository in Azure DevOps, with dashes"
  sensitive   = false
  value       = local.azdo.git_repository_development_branch_dash
}

output "git_repository_development_branch_slash" {
  description = "The development branch of the Git repository in Azure DevOps, formatted with slashes"
  sensitive   = false
  value       = local.azdo.git_repository_development_branch_slash
}

output "git_repository_feature_branch_dash" {
  description = "The feature branch of the Git repository in Azure DevOps, formatted with dashes"
  sensitive   = false
  value       = local.azdo.git_repository_feature_branch_dash
}

output "git_repository_feature_branch_slash" {
  description = "The feature branch of the Git repository in Azure DevOps, formatted with slashes"
  sensitive   = false
  value       = local.azdo.git_repository_feature_branch_slash
}

output "git_repository_fix_branch_dash" {
  description = "The fix branch of the Git repository in Azure DevOps, formatted with dashes"
  sensitive   = false
  value       = local.azdo.git_repository_fix_branch_dash
}

output "git_repository_fix_branch_slash" {
  description = "The fix branch of the Git repository in Azure DevOps, formatted with slashes"
  sensitive   = false
  value       = local.azdo.git_repository_fix_branch_slash
}

output "git_repository_hotfix_branch_dash" {
  description = "The hotfix branch of the Git repository in Azure DevOps, formatted with dashes"
  sensitive   = false
  value       = local.azdo.git_repository_hotfix_branch_dash
}

output "git_repository_hotfix_branch_slash" {
  description = "The hotfix branch of the Git repository in Azure DevOps, formatted with slashes"
  sensitive   = false
  value       = local.azdo.git_repository_hotfix_branch_slash
}

output "git_repository_release_branch_dash" {
  description = "The release branch of the Git repository in Azure DevOps, formatted with dashes"
  sensitive   = false
  value       = local.azdo.git_repository_release_branch_dash
}

output "git_repository_release_branch_slash" {
  description = "The release branch of the Git repository in Azure DevOps, formatted with slashes"
  sensitive   = false
  value       = local.azdo.git_repository_release_branch_slash
}

output "group" {
  description = "The group in Azure DevOps"
  sensitive   = false
  value       = local.azdo.group
}

output "project" {
  description = "The project in Azure DevOps"
  sensitive   = false
  value       = local.azdo.project
}

output "serviceendpoint_argocd" {
  description = "The ArgoCD service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_argocd
}

output "serviceendpoint_artifactory" {
  description = "The Artifactory service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_artifactory
}

output "serviceendpoint_aws" {
  description = "The AWS service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_aws
}

output "serviceendpoint_azurecr" {
  description = "The Azure Container Registry service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_azurecr
}

output "serviceendpoint_azuredevops" {
  description = "The Azure DevOps service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_azuredevops
}

output "serviceendpoint_azurerm" {
  description = "The Azure Resource Manager service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_azurerm
}

output "serviceendpoint_bitbucket" {
  description = "The Bitbucket service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_bitbucket
}

output "serviceendpoint_dockerregistry" {
  description = "The Docker Registry service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_dockerregistry
}

output "serviceendpoint_externaltfs" {
  description = "The external TFS service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_externaltfs
}

output "serviceendpoint_gcp_terraform" {
  description = "The GCP Terraform service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_gcp_terraform
}

output "serviceendpoint_generic" {
  description = "The generic service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_generic
}

output "serviceendpoint_generic_git" {
  description = "The generic Git service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_generic_git
}

output "serviceendpoint_github" {
  description = "The GitHub service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_github
}

output "serviceendpoint_github_enterprise" {
  description = "The GitHub Enterprise service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_github_enterprise
}

output "serviceendpoint_incomingwebhook" {
  description = "The incoming webhook service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_incomingwebhook
}

output "serviceendpoint_jenkins" {
  description = "The Jenkins service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_jenkins
}

output "serviceendpoint_jfrog_artifactory_v2" {
  description = "The JFrog Artifactory v2 service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_jfrog_artifactory_v2
}

output "serviceendpoint_jfrog_distribution_v2" {
  description = "The JFrog Distribution v2 service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_jfrog_distribution_v2
}

output "serviceendpoint_jfrog_platform_v2" {
  description = "The JFrog Platform v2 service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_jfrog_platform_v2
}

output "serviceendpoint_jfrog_xray_v2" {
  description = "The JFrog Xray v2 service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_jfrog_xray_v2
}

output "serviceendpoint_kubernetes" {
  description = "The Kubernetes service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_kubernetes
}

output "serviceendpoint_maven" {
  description = "The Maven service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_maven
}

output "serviceendpoint_nexus" {
  description = "The Nexus service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_nexus
}

output "serviceendpoint_npm" {
  description = "The NPM service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_npm
}

output "serviceendpoint_nuget" {
  description = "The NuGet service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_nuget
}

output "serviceendpoint_octopusdeploy" {
  description = "The Octopus Deploy service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_octopusdeploy
}

output "serviceendpoint_runpipeline" {
  description = "The Run Pipeline service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_runpipeline
}

output "serviceendpoint_servicefabric" {
  description = "The Service Fabric service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_servicefabric
}

output "serviceendpoint_sonarcloud" {
  description = "The SonarCloud service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_sonarcloud
}

output "serviceendpoint_sonarqube" {
  description = "The SonarQube service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_sonarqube
}

output "serviceendpoint_ssh" {
  description = "The SSH service endpoint in Azure DevOps"
  sensitive   = false
  value       = local.azdo.serviceendpoint_ssh
}

output "team" {
  description = "The team in Azure DevOps"
  sensitive   = false
  value       = local.azdo.team
}

output "variable_group" {
  description = "The variable group in Azure DevOps"
  sensitive   = false
  value       = local.azdo.variable_group
}

output "unique_seed" {
  description = "A custom value for generating random characters, used when a unique seed is not provided"
  sensitive   = false
  value       = coalesce(var.unique_seed, local.random_safe_generation)
}

output "validation" {
  description = "The validation rules that have been applied"
  sensitive   = false
  value       = local.validation
}
