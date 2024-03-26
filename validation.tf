# purpose: Define validation rules for generated names

locals {

  # Validation rules for names
  validation = {

    area_path = {
      valid_name        = length(regexall(local.azdo.area_path.regex, local.azdo.area_path.name)) > 0 && length(local.azdo.area_path.name) > local.azdo.area_path.min_length
      valid_name_unique = length(regexall(local.azdo.area_path.regex, local.azdo.area_path.name_unique)) > 0
    }

    artifact = {
      valid_name        = length(regexall(local.azdo.artifact.regex, local.azdo.artifact.name)) > 0 && length(local.azdo.artifact.name) > local.azdo.artifact.min_length
      valid_name_unique = length(regexall(local.azdo.artifact.regex, local.azdo.artifact.name_unique)) > 0
    }

    iteration_path = {
      valid_name        = length(regexall(local.azdo.iteration_path.regex, local.azdo.iteration_path.name)) > 0 && length(local.azdo.iteration_path.name) > local.azdo.iteration_path.min_length
      valid_name_unique = length(regexall(local.azdo.iteration_path.regex, local.azdo.iteration_path.name_unique)) > 0
    }

    organization = {
      valid_name        = length(regexall(local.azdo.organization.regex, local.azdo.organization.name)) > 0 && length(local.azdo.organization.name) > local.azdo.organization.min_length
      valid_name_unique = length(regexall(local.azdo.organization.regex, local.azdo.organization.name_unique)) > 0
    }

    process = {
      valid_name        = length(regexall(local.azdo.process.regex, local.azdo.process.name)) > 0 && length(local.azdo.process.name) > local.azdo.process.min_length
      valid_name_unique = length(regexall(local.azdo.process.regex, local.azdo.process.name_unique)) > 0
    }

    project = {
      valid_name        = length(regexall(local.azdo.project.regex, local.azdo.project.name)) > 0 && length(local.azdo.project.name) > local.azdo.project.min_length
      valid_name_unique = length(regexall(local.azdo.project.regex, local.azdo.project.name_unique)) > 0
    }

    security_group = {
      valid_name        = length(regexall(local.az.security_group.regex, local.az.security_group.name)) > 0 && length(local.az.security_group.name) > local.az.security_group.min_length
      valid_name_unique = length(regexall(local.az.security_group.regex, local.az.security_group.name_unique)) > 0
    }

    team = {
      valid_name        = length(regexall(local.azdo.team.regex, local.azdo.team.name)) > 0 && length(local.azdo.team.name) > local.azdo.team.min_length
      valid_name_unique = length(regexall(local.azdo.team.regex, local.azdo.team.name_unique)) > 0
    }

    tfvc_shelveset = {
      valid_name        = length(regexall(local.azdo.tfvc_shelveset.regex, local.azdo.tfvc_shelveset.name)) > 0 && length(local.azdo.tfvc_shelveset.name) > local.azdo.tfvc_shelveset.min_length
      valid_name_unique = length(regexall(local.azdo.tfvc_shelveset.regex, local.azdo.tfvc_shelveset.name_unique)) > 0
    }

    tfvc_workspace = {
      valid_name        = length(regexall(local.azdo.tfvc_workspace.regex, local.azdo.tfvc_workspace.name)) > 0 && length(local.azdo.tfvc_workspace.name) > local.azdo.tfvc_workspace.min_length
      valid_name_unique = length(regexall(local.azdo.tfvc_workspace.regex, local.azdo.tfvc_workspace.name_unique)) > 0
    }

  }
}
