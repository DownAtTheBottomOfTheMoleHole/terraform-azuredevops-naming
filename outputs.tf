output "unique-seed" {
  description = "Custom value for the random characters to be used"
  value = coalesce(var.unique-seed, local.random_safe_generation)
}

output "validation" {
  description = "Validtion rules applied"
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