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

    board_column = {
      valid_name        = length(regexall(local.azdo.board_column.regex, local.azdo.board_column.name)) > 0 && length(local.azdo.board_column.name) > local.azdo.board_column.min_length
      valid_name_unique = length(regexall(local.azdo.board_column.regex, local.azdo.board_column.name_unique)) > 0
    }

    board_swimlane = {
      valid_name        = length(regexall(local.azdo.board_swimlane.regex, local.azdo.board_swimlane.name)) > 0 && length(local.azdo.board_swimlane.name) > local.azdo.board_swimlane.min_length
      valid_name_unique = length(regexall(local.azdo.board_swimlane.regex, local.azdo.board_swimlane.name_unique)) > 0
    }

    filed_name = {
      valid_name        = length(regexall(local.azdo.field_name.regex, local.azdo.field_name.name)) > 0 && length(local.azdo.field_name.name) > local.azdo.field_name.min_length
      valid_name_unique = length(regexall(local.azdo.field_name.regex, local.azdo.field_name.name_unique)) > 0
    }

    git_repo = {
      valid_name        = length(regexall(local.azdo.git_repo.regex, local.azdo.git_repo.name)) > 0 && length(local.azdo.git_repo.name) > local.azdo.git_repo.min_length
      valid_name_unique = length(regexall(local.azdo.git_repo.regex, local.azdo.git_repo.name_unique)) > 0
    }

    iteration_path = {
      valid_name        = length(regexall(local.azdo.iteration_path.regex, local.azdo.iteration_path.name)) > 0 && length(local.azdo.iteration_path.name) > local.azdo.iteration_path.min_length
      valid_name_unique = length(regexall(local.azdo.iteration_path.regex, local.azdo.iteration_path.name_unique)) > 0
    }

    organization = {
      valid_name        = length(regexall(local.azdo.organization.regex, local.azdo.organization.name)) > 0 && length(local.azdo.organization.name) > local.azdo.organization.min_length
      valid_name_unique = length(regexall(local.azdo.organization.regex, local.azdo.organization.name_unique)) > 0
    }

    pipeline_expression = {
      valid_name        = length(regexall(local.azdo.pipeline_expression.regex, local.azdo.pipeline_expression.name)) > 0 && length(local.azdo.pipeline_expression.name) > local.azdo.pipeline_expression.min_length
      valid_name_unique = length(regexall(local.azdo.pipeline_expression.regex, local.azdo.pipeline_expression.name_unique)) > 0
    }

    pipeline_job = {
      valid_name        = length(regexall(local.azdo.pipeline_job.regex, local.azdo.pipeline_job.name)) > 0 && length(local.azdo.pipeline_job.name) > local.azdo.pipeline_job.min_length
      valid_name_unique = length(regexall(local.azdo.pipeline_job.regex, local.azdo.pipeline_job.name_unique)) > 0
    }

    pipeline_stage = {
      valid_name        = length(regexall(local.azdo.pipeline_stage.regex, local.azdo.pipeline_stage.name)) > 0 && length(local.azdo.pipeline_stage.name) > local.azdo.pipeline_stage.min_length
      valid_name_unique = length(regexall(local.azdo.pipeline_stage.regex, local.azdo.pipeline_stage.name_unique)) > 0
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
      valid_name        = length(regexall(local.azdo.security_group.regex, local.azdo.security_group.name)) > 0 && length(local.azdo.security_group.name) > local.azdo.security_group.min_length
      valid_name_unique = length(regexall(local.azdo.security_group.regex, local.azdo.security_group.name_unique)) > 0
    }

    team = {
      valid_name        = length(regexall(local.azdo.team.regex, local.azdo.team.name)) > 0 && length(local.azdo.team.name) > local.azdo.team.min_length
      valid_name_unique = length(regexall(local.azdo.team.regex, local.azdo.team.name_unique)) > 0
    }

    tfvc_file = {
      valid_name        = length(regexall(local.azdo.tfvc_file.regex, local.azdo.tfvc_file.name)) > 0 && length(local.azdo.tfvc_file.name) > local.azdo.tfvc_file.min_length
      valid_name_unique = length(regexall(local.azdo.tfvc_file.regex, local.azdo.tfvc_file.name_unique)) > 0
    }

    tfvc_label = {
      valid_name        = length(regexall(local.azdo.tfvc_label.regex, local.azdo.tfvc_label.name)) > 0 && length(local.azdo.tfvc_label.name) > local.azdo.tfvc_label.min_length
      valid_name_unique = length(regexall(local.azdo.tfvc_label.regex, local.azdo.tfvc_label.name_unique)) > 0
    }

    tfvc_repo = {
      valid_name        = length(regexall(local.azdo.tfvc_repo.regex, local.azdo.tfvc_repo.name)) > 0 && length(local.azdo.tfvc_repo.name) > local.azdo.tfvc_repo.min_length
      valid_name_unique = length(regexall(local.azdo.tfvc_repo.regex, local.azdo.tfvc_repo.name_unique)) > 0
    }

    tfvc_shelveset = {
      valid_name        = length(regexall(local.azdo.tfvc_shelveset.regex, local.azdo.tfvc_shelveset.name)) > 0 && length(local.azdo.tfvc_shelveset.name) > local.azdo.tfvc_shelveset.min_length
      valid_name_unique = length(regexall(local.azdo.tfvc_shelveset.regex, local.azdo.tfvc_shelveset.name_unique)) > 0
    }

    tfvc_workspace = {
      valid_name        = length(regexall(local.azdo.tfvc_workspace.regex, local.azdo.tfvc_workspace.name)) > 0 && length(local.azdo.tfvc_workspace.name) > local.azdo.tfvc_workspace.min_length
      valid_name_unique = length(regexall(local.azdo.tfvc_workspace.regex, local.azdo.tfvc_workspace.name_unique)) > 0
    }

    work_item_tag = {
      valid_name        = length(regexall(local.azdo.work_item_tag.regex, local.azdo.work_item_tag.name)) > 0 && length(local.azdo.work_item_tag.name) > local.azdo.work_item_tag.min_length
      valid_name_unique = length(regexall(local.azdo.work_item_tag.regex, local.azdo.work_item_tag.name_unique)) > 0
    }

  }
}
