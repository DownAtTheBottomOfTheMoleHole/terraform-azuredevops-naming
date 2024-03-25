output "aws_access_key" {
  value       = var.aws_access_key
  description = "The AWS Access Key"
  sensitive   = true
}

output "aws_profile" {
  value       = var.aws_profile
  description = "The AWS profile used"
  sensitive   = false
}

output "aws_resource_location" {
  value       = var.aws_resource_location
  description = "The AWS region used for the resources"
  sensitive   = false
}

output "azure_subscription_display_name" {
  value       = data.azurerm_subscription.azrm.display_name
  description = "The current subscription name"
  sensitive   = false
}

output "azure_subscription_id" {
  value       = data.azurerm_subscription.azrm.id
  description = "The current subscription id"
  sensitive   = false
}

output "azuredevops_project_name" {
  value       = data.azuredevops_project.azdo.name
  description = "The current Azure DevOps name"
  sensitive   = false
}

output "application_name" {
  value       = var.application_name
  description = "The project/application name for this repository"
  sensitive   = false
}

output "application_shortname" {
  value       = var.application_shortname
  description = "The shortened project/application name for this repository"
  sensitive   = false
}

output "azdo_orgurl" {
  value       = var.azdo_orgurl
  description = "The Azure DevOps URL used for this run"
  sensitive   = false
}

output "azdo_pat" {
  value       = var.azdo_pat
  description = "The Azure DevOps Personal Access Token (PAT) used for this run"
  sensitive   = true
}

output "azrm_client_id" {
  value       = var.azrm_client_id
  description = "The ID of the service principal used for this run"
  sensitive   = false
}

output "environment" {
  value       = var.environment_tag
  description = "The environment being worked on with this run"
  sensitive   = false
}

output "azrm_resource_location" {
  value       = var.azrm_resource_location
  description = "The location of resources being worked on with this run"
  sensitive   = false
}

output "tags" {
  value = merge(
    var.default_tags,
    local.tags
  )
  description = "The tags applied to resources as part of this run"
  sensitive   = false
}

output "tenant_id" {
  value       = var.azrm_tenant_id
  description = "The azure tenant id of resources being worked on with this run"
  sensitive   = false
}
