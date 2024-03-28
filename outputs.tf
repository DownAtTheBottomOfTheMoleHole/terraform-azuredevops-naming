output "agent_pool" {
  description = "Agent Pool"
  value       = local.azdo.agent_pool
}

output "branch_policy_build_validation" {
  description = "Branch Policy Build Validation display name"
  value       = local.azdo.branch_policy_build_validation
}

output "build_definition" {
  description = "Build Definition"
  value       = local.azdo.build_definition
}

output "build_folder" {
  description = "Build Folder"
  value       = local.azdo.build_folder
}

output "elastic_pool" {
  description = "Elastic Pool"
  value       = local.azdo.elastic_pool
}

output "environment" {
  description = "Environment"
  value       = local.azdo.environment
}

output "git_repository" {
  description = "Git Repository"
  value       = local.azdo.git_repository
}

output "git_repository_branch" {
  description = "Git Repository Branch"
  value       = local.azdo.git_repository_branch
}

output "group" {
  description = "Group"
  value       = local.azdo.group
}

output "project" {
  description = "Project"
  value       = local.azdo.project
}

output "serviceendpoint_argocd" {
  description = "Service Endpoint Argocd"
  value       = local.azdo.serviceendpoint_argocd
}

output "serviceendpoint_artifactory" {
  description = "Service Endpoint Artifactory"
  value       = local.azdo.serviceendpoint_artifactory
}

output "serviceendpoint_aws" {
  description = "Service Endpoint AWS"
  value       = local.azdo.serviceendpoint_aws
}

output "serviceendpoint_azurecr" {
  description = "Service Endpoint Azure Container Registry"
  value       = local.azdo.serviceendpoint_azurecr
}

output "serviceendpoint_azuredevops" {
  description = "Service Endpoint Azure DevOps"
  value       = local.azdo.serviceendpoint_azuredevops
}

output "serviceendpoint_azurerm" {
  description = "Service Endpoint AzureRM"
  value       = local.azdo.serviceendpoint_azurerm
}

output "serviceendpoint_bitbucket" {
  description = "Service Endpoint Bitbucket"
  value       = local.azdo.serviceendpoint_bitbucket
}

output "serviceendpoint_dockerregistry" {
  description = "Service Endpoint Docker Registry"
  value       = local.azdo.serviceendpoint_dockerregistry
}

output "serviceendpoint_externaltfs" {
  description = "Service Endpoint External TFS"
  value       = local.azdo.serviceendpoint_externaltfs
}

output "serviceendpoint_gcp_terraform" {
  description = "Service Endpoint GCP Terraform"
  value       = local.azdo.serviceendpoint_gcp_terraform
}

output "serviceendpoint_generic" {
  description = "Service Endpoint Generic"
  value       = local.azdo.serviceendpoint_generic
}

output "serviceendpoint_generic_git" {
  description = "Service Endpoint Generic Git"
  value       = local.azdo.serviceendpoint_generic_git
}

output "serviceendpoint_github" {
  description = "Service Endpoint GitHub"
  value       = local.azdo.serviceendpoint_github
}

output "serviceendpoint_github_enterprise" {
  description = "Service Endpoint GitHub Enterprise"
  value       = local.azdo.serviceendpoint_github_enterprise
}

output "serviceendpoint_incomingwebhook" {
  description = "Service Endpoint Incoming Webhook"
  value       = local.azdo.serviceendpoint_incomingwebhook
}

output "serviceendpoint_jenkins" {
  description = "Service Endpoint Jenkins"
  value       = local.azdo.serviceendpoint_jenkins
}

output "serviceendpoint_jfrog_artifactory_v2" {
  description = "Service Endpoint JFrog Artifactory v2"
  value       = local.azdo.serviceendpoint_jfrog_artifactory_v2
}

output "serviceendpoint_jfrog_distribution_v2" {
  description = "Service Endpoint JFrog Distribution v2"
  value       = local.azdo.serviceendpoint_jfrog_distribution_v2
}

output "serviceendpoint_jfrog_platform_v2" {
  description = "Service Endpoint Platform v2"
  value       = local.azdo.serviceendpoint_jfrog_platform_v2
}

output "serviceendpoint_jfrog_xray_v2" {
  description = "Service Endpoint Xray v2"
  value       = local.azdo.serviceendpoint_jfrog_xray_v2
}

output "serviceendpoint_kubernetes" {
  description = "Service Endpoint Kubernetes"
  value       = local.azdo.serviceendpoint_kubernetes
}

output "serviceendpoint_maven" {
  description = "Service Endpoint Maven"
  value       = local.azdo.serviceendpoint_maven
}

output "serviceendpoint_nexus" {
  description = "Service Endpoint Nexus"
  value       = local.azdo.serviceendpoint_nexus
}

output "serviceendpoint_npm" {
  description = "Service Endpoint NPM"
  value       = local.azdo.serviceendpoint_npm
}

output "serviceendpoint_nuget" {
  description = "Service Endpoint NuGet"
  value       = local.azdo.serviceendpoint_nuget
}

output "serviceendpoint_octopusdeploy" {
  description = "Service Endpoint Octopus Deploy"
  value       = local.azdo.serviceendpoint_octopusdeploy
}

output "serviceendpoint_runpipeline" {
  description = "Service Endpoint Run Pipeline"
  value       = local.azdo.serviceendpoint_runpipeline
}

output "serviceendpoint_servicefabric" {
  description = "Service Endpoint Service Fabric"
  value       = local.azdo.serviceendpoint_servicefabric
}

output "serviceendpoint_sonarcloud" {
  description = "Service Endpoint SonarCloud"
  value       = local.azdo.serviceendpoint_sonarcloud
}

output "serviceendpoint_sonarqube" {
  description = "Service Endpoint SonarQube"
  value       = local.azdo.serviceendpoint_sonarqube
}

output "serviceendpoint_ssh" {
  description = "Service Endpoint SSH"
  value       = local.azdo.serviceendpoint_ssh
}

output "team" {
  description = "Team"
  value       = local.azdo.team
}

output "variable_group" {
  description = "Variable Group"
  value       = local.azdo.variable_group
}

output "unique_seed" {
  description = "Custom value for the random characters to be used"
  value       = coalesce(var.unique_seed, local.random_safe_generation)
}

output "validation" {
  description = "Validation rules applied"
  value       = local.validation
}
