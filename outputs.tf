output "area_path" {
  description = "Azure DevOps Area Path"
  value       = local.azdo.area_path
}

output "artifact" {
  description = "Azure DevOps Artifact"
  value       = local.azdo.artifact
}

output "board_column" {
  description = "Azure DevOps Board Column"
  value       = local.azdo.board_column
}

output "board_swimlane" {
  description = "Azure DevOps Board Swimlane"
  value       = local.azdo.board_swimlane
}

output "field_name" {
  description = "Azure DevOps Field Name"
  value       = local.azdo.field_name
}

output "git_repo" {
  description = "Azure DevOps Git Repository"
  value       = local.azdo.git_repository
}

output "iteration_path" {
  description = "Azure DevOps Iteration Path"
  value       = local.azdo.iteration_path
}

output "organization" {
  description = "Azure DevOps Organization"
  value       = local.azdo.organization
}

output "pipeline_expression" {
  description = "Azure DevOps Pipeline Expression"
  value       = local.azdo.pipeline_expression
}

output "pipeline_job" {
  description = "Azure DevOps Pipeline job Name"
  value       = local.azdo.pipeline_job
}

output "pipeline_stage" {
  description = "Azure DevOps Pipeline atage Name"
  value       = local.azdo.pipeline_stage
}

output "process" {
  description = "Azure DevOps Process"
  value       = local.azdo.process
}

output "project" {
  description = "Azure DevOps Project"
  value       = local.azdo.project
}

output "security_group" {
  description = "Azure Security Group"
  value       = local.azdo.security_group
}

output "team" {
  description = "Azure DevOps Team"
  value       = local.azdo.team
}

output "tfvc_file" {
  description = "Azure DevOps TFVC File"
  value       = local.azdo.tfvc_file
}

output "tfvc_label" {
  description = "Azure DevOps TFVC Label"
  value       = local.azdo.tfvc_label
}

output "tfvc_repo" {
  description = "Azure DevOps TFVC repo"
  value       = local.azdo.tfvc_repo
}

output "tfvc_shelveset" {
  description = "Azure DevOps TFVC Shelveset"
  value       = local.azdo.tfvc_shelveset
}

output "tfvc_workspace" {
  description = "Azure DevOps TFVC Workspace"
  value       = local.azdo.tfvc_workspace
}

output "unique-seed" {
  description = "Custom value for the random characters to be used"
  value       = coalesce(var.unique-seed, local.random_safe_generation)
}

output "validation" {
  description = "Validation rules applied"
  value       = local.validation
}

output "work_item_tag" {
  description = "Azure DevOps Work Item Tag"
  value       = local.azdo.work_item_tag
}