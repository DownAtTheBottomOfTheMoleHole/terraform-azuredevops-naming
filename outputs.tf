output "unique-seed" {
  value = coalesce(var.unique-seed, local.random_safe_generation)
}

output "validation" {
  value = local.validation
}
output "organization" {
  value       = local.azdo.organization
  description = "Azure DevOps Organization"
}

output "project" {
  value       = local.azdo.project
  description = "Azure DevOps Project"
}