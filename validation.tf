# purpose: Define validation rules for generated names

locals {

  system_reserved_names = [
    "aux",
    "com1",
    "com2",
    "com3",
    "com4",
    "com5",
    "com6",
    "com7",
    "com8",
    "com9",
    "com10",
    "con",
    "defaultcollection",
    "lpt1",
    "lpt2",
    "lpt3",
    "lpt4",
    "lpt5",
    "lpt6",
    "lpt7",
    "lpt8",
    "lpt9",
    "nul",
    "prn",
    "server",
    "signalr",
    "web",
  ]

  project_hidden_names = [
    "app_browsers",
    "app_code",
    "app_data",
    "app_globalresources",
    "app_localresources",
    "app_themes",
    "app_webresources",
    "bin",
    "web.config",
  ]

  git_branch_definitions = {
    git_repository_branch                   = { default = local.azdo.git_repository_branch }
    git_repository_bug_branch_dash          = local.azdo.git_repository_bug_branch_dash
    git_repository_bug_branch_slash         = local.azdo.git_repository_bug_branch_slash
    git_repository_dev_branch_dash          = local.azdo.git_repository_dev_branch_dash
    git_repository_dev_branch_slash         = local.azdo.git_repository_dev_branch_slash
    git_repository_development_branch_dash  = local.azdo.git_repository_development_branch_dash
    git_repository_development_branch_slash = local.azdo.git_repository_development_branch_slash
    git_repository_feature_branch_dash      = local.azdo.git_repository_feature_branch_dash
    git_repository_feature_branch_slash     = local.azdo.git_repository_feature_branch_slash
    git_repository_fix_branch_dash          = local.azdo.git_repository_fix_branch_dash
    git_repository_fix_branch_slash         = local.azdo.git_repository_fix_branch_slash
    git_repository_hotfix_branch_dash       = local.azdo.git_repository_hotfix_branch_dash
    git_repository_hotfix_branch_slash      = local.azdo.git_repository_hotfix_branch_slash
    git_repository_release_branch_dash      = local.azdo.git_repository_release_branch_dash
    git_repository_release_branch_slash     = local.azdo.git_repository_release_branch_slash
    git_repository_support_branch_dash      = local.azdo.git_repository_support_branch_dash
    git_repository_support_branch_slash     = local.azdo.git_repository_support_branch_slash
  }

  git_branch_validation = {
    for group, definitions in local.git_branch_definitions : group => {
      for item, definition in definitions : item => {
        for result, candidate in {
          valid_name        = definition.name
          valid_name_unique = definition.name_unique
          } : result => (
          length(regexall(definition.regex, candidate)) > 0 &&
          length(candidate) >= definition.min_length &&
          length(candidate) <= definition.max_length &&
          !startswith(candidate, "-") &&
          !startswith(candidate, "/") &&
          !endswith(candidate, "/") &&
          !endswith(candidate, ".") &&
          !strcontains(candidate, "//") &&
          !strcontains(candidate, "..") &&
          !strcontains(candidate, "@{") &&
          alltrue([
            for component in split("/", candidate) :
            component != "" && !startswith(component, ".") && !endswith(component, ".lock")
          ])
        )
      }
    }
  }

  pipeline_reserved_prefixes = ["endpoint", "input", "secret", "path", "securefile"]

  azure_url_name_definitions = {
    git_repository = {
      definition        = local.azdo.git_repository
      reject_double_dot = false
      reject_hidden     = false
    }
    project = {
      definition        = local.azdo.project
      reject_double_dot = false
      reject_hidden     = true
    }
    team = {
      definition        = local.azdo.team
      reject_double_dot = true
      reject_hidden     = false
    }
  }

  azure_url_name_validation = {
    for key, spec in local.azure_url_name_definitions : key => {
      for result, candidate in {
        valid_name        = spec.definition.name
        valid_name_unique = spec.definition.name_unique
        } : result => (
        length(regexall(spec.definition.regex, candidate)) > 0 &&
        length(candidate) >= spec.definition.min_length &&
        length(candidate) <= spec.definition.max_length &&
        !startswith(candidate, "_") &&
        !startswith(candidate, ".") &&
        !endswith(candidate, ".") &&
        (!spec.reject_double_dot || !strcontains(candidate, "..")) &&
        !contains(local.system_reserved_names, lower(candidate)) &&
        (!spec.reject_hidden || !contains(local.project_hidden_names, lower(candidate)))
      )
    }
  }

  pipeline_variable_definitions = {
    pipeline_variable       = local.azdo.pipeline_variable
    variable_group_variable = local.azdo.variable_group_variable
  }

  pipeline_variable_validation = {
    for key, definition in local.pipeline_variable_definitions : key => {
      for result, candidate in {
        valid_name        = definition.name
        valid_name_unique = definition.name_unique
        } : result => (
        length(regexall(definition.regex, candidate)) > 0 &&
        length(candidate) >= definition.min_length &&
        length(candidate) <= definition.max_length &&
        alltrue([
          for prefix in local.pipeline_reserved_prefixes :
          !startswith(lower(candidate), prefix)
        ])
      )
    }
  }

  # Validation rules for names
  validation = {

    agent_pool = {
      valid_name        = length(regexall(local.azdo.agent_pool.regex, local.azdo.agent_pool.name)) > 0 && length(local.azdo.agent_pool.name) >= local.azdo.agent_pool.min_length && length(local.azdo.agent_pool.name) <= local.azdo.agent_pool.max_length
      valid_name_unique = length(regexall(local.azdo.agent_pool.regex, local.azdo.agent_pool.name_unique)) > 0 && length(local.azdo.agent_pool.name_unique) >= local.azdo.agent_pool.min_length && length(local.azdo.agent_pool.name_unique) <= local.azdo.agent_pool.max_length
    }

    branch_policy_build_validation = {
      valid_name        = length(regexall(local.azdo.branch_policy_build_validation.regex, local.azdo.branch_policy_build_validation.name)) > 0 && length(local.azdo.branch_policy_build_validation.name) >= local.azdo.branch_policy_build_validation.min_length && length(local.azdo.branch_policy_build_validation.name) <= local.azdo.branch_policy_build_validation.max_length
      valid_name_unique = length(regexall(local.azdo.branch_policy_build_validation.regex, local.azdo.branch_policy_build_validation.name_unique)) > 0 && length(local.azdo.branch_policy_build_validation.name_unique) >= local.azdo.branch_policy_build_validation.min_length && length(local.azdo.branch_policy_build_validation.name_unique) <= local.azdo.branch_policy_build_validation.max_length
    }

    build_definition = {
      valid_name        = length(regexall(local.azdo.build_definition.regex, local.azdo.build_definition.name)) > 0 && length(local.azdo.build_definition.name) >= local.azdo.build_definition.min_length && length(local.azdo.build_definition.name) <= local.azdo.build_definition.max_length
      valid_name_unique = length(regexall(local.azdo.build_definition.regex, local.azdo.build_definition.name_unique)) > 0 && length(local.azdo.build_definition.name_unique) >= local.azdo.build_definition.min_length && length(local.azdo.build_definition.name_unique) <= local.azdo.build_definition.max_length
    }

    build_folder = {
      valid_name        = length(regexall(local.azdo.build_folder.regex, local.azdo.build_folder.name)) > 0 && length(local.azdo.build_folder.name) >= local.azdo.build_folder.min_length && length(local.azdo.build_folder.name) <= local.azdo.build_folder.max_length
      valid_name_unique = length(regexall(local.azdo.build_folder.regex, local.azdo.build_folder.name_unique)) > 0 && length(local.azdo.build_folder.name_unique) >= local.azdo.build_folder.min_length && length(local.azdo.build_folder.name_unique) <= local.azdo.build_folder.max_length
    }

    elastic_pool = {
      valid_name        = length(regexall(local.azdo.elastic_pool.regex, local.azdo.elastic_pool.name)) > 0 && length(local.azdo.elastic_pool.name) >= local.azdo.elastic_pool.min_length && length(local.azdo.elastic_pool.name) <= local.azdo.elastic_pool.max_length
      valid_name_unique = length(regexall(local.azdo.elastic_pool.regex, local.azdo.elastic_pool.name_unique)) > 0 && length(local.azdo.elastic_pool.name_unique) >= local.azdo.elastic_pool.min_length && length(local.azdo.elastic_pool.name_unique) <= local.azdo.elastic_pool.max_length
    }

    environment = { for tag in local.translated_environment_tags : tag => {
      valid_name        = length(regexall(local.azdo.environment[tag].regex, local.azdo.environment[tag].name)) > 0 && length(local.azdo.environment[tag].name) >= local.azdo.environment[tag].min_length && length(local.azdo.environment[tag].name) <= local.azdo.environment[tag].max_length
      valid_name_unique = length(regexall(local.azdo.environment[tag].regex, local.azdo.environment[tag].name_unique)) > 0 && length(local.azdo.environment[tag].name_unique) >= local.azdo.environment[tag].min_length && length(local.azdo.environment[tag].name_unique) <= local.azdo.environment[tag].max_length
    } }

    environment_apply = { for tag in local.translated_environment_tags : tag => {
      valid_name        = length(regexall(local.azdo.environment_apply[tag].regex, local.azdo.environment_apply[tag].name)) > 0 && length(local.azdo.environment_apply[tag].name) >= local.azdo.environment_apply[tag].min_length && length(local.azdo.environment_apply[tag].name) <= local.azdo.environment_apply[tag].max_length
      valid_name_unique = length(regexall(local.azdo.environment_apply[tag].regex, local.azdo.environment_apply[tag].name_unique)) > 0 && length(local.azdo.environment_apply[tag].name_unique) >= local.azdo.environment_apply[tag].min_length && length(local.azdo.environment_apply[tag].name_unique) <= local.azdo.environment_apply[tag].max_length
    } }

    environment_apply_basic = { for tag in local.translated_environment_tags : tag => {
      valid_name        = length(regexall(local.azdo.environment_apply_basic[tag].regex, local.azdo.environment_apply_basic[tag].name)) > 0 && length(local.azdo.environment_apply_basic[tag].name) >= local.azdo.environment_apply_basic[tag].min_length && length(local.azdo.environment_apply_basic[tag].name) <= local.azdo.environment_apply_basic[tag].max_length
      valid_name_unique = length(regexall(local.azdo.environment_apply_basic[tag].regex, local.azdo.environment_apply_basic[tag].name_unique)) > 0 && length(local.azdo.environment_apply_basic[tag].name_unique) >= local.azdo.environment_apply_basic[tag].min_length && length(local.azdo.environment_apply_basic[tag].name_unique) <= local.azdo.environment_apply_basic[tag].max_length
    } }

    environment_basic = { for tag in local.translated_environment_tags : tag => {
      valid_name        = length(regexall(local.azdo.environment_basic[tag].regex, local.azdo.environment_basic[tag].name)) > 0 && length(local.azdo.environment_basic[tag].name) >= local.azdo.environment_basic[tag].min_length && length(local.azdo.environment_basic[tag].name) <= local.azdo.environment_basic[tag].max_length
      valid_name_unique = length(regexall(local.azdo.environment_basic[tag].regex, local.azdo.environment_basic[tag].name_unique)) > 0 && length(local.azdo.environment_basic[tag].name_unique) >= local.azdo.environment_basic[tag].min_length && length(local.azdo.environment_basic[tag].name_unique) <= local.azdo.environment_basic[tag].max_length
    } }

    environment_plan = { for tag in local.translated_environment_tags : tag => {
      valid_name        = length(regexall(local.azdo.environment_plan[tag].regex, local.azdo.environment_plan[tag].name)) > 0 && length(local.azdo.environment_plan[tag].name) >= local.azdo.environment_plan[tag].min_length && length(local.azdo.environment_plan[tag].name) <= local.azdo.environment_plan[tag].max_length
      valid_name_unique = length(regexall(local.azdo.environment_plan[tag].regex, local.azdo.environment_plan[tag].name_unique)) > 0 && length(local.azdo.environment_plan[tag].name_unique) >= local.azdo.environment_plan[tag].min_length && length(local.azdo.environment_plan[tag].name_unique) <= local.azdo.environment_plan[tag].max_length
    } }

    environment_plan_basic = { for tag in local.translated_environment_tags : tag => {
      valid_name        = length(regexall(local.azdo.environment_plan_basic[tag].regex, local.azdo.environment_plan_basic[tag].name)) > 0 && length(local.azdo.environment_plan_basic[tag].name) >= local.azdo.environment_plan_basic[tag].min_length && length(local.azdo.environment_plan_basic[tag].name) <= local.azdo.environment_plan_basic[tag].max_length
      valid_name_unique = length(regexall(local.azdo.environment_plan_basic[tag].regex, local.azdo.environment_plan_basic[tag].name_unique)) > 0 && length(local.azdo.environment_plan_basic[tag].name_unique) >= local.azdo.environment_plan_basic[tag].min_length && length(local.azdo.environment_plan_basic[tag].name_unique) <= local.azdo.environment_plan_basic[tag].max_length
    } }

    environment_work_item = { for tag in local.translated_environment_tags : tag => {
      for item in local.unique_work_items : item => {
        valid_name        = length(regexall(local.azdo.environment_work_item[tag][item].regex, local.azdo.environment_work_item[tag][item].name)) > 0 && length(local.azdo.environment_work_item[tag][item].name) >= local.azdo.environment_work_item[tag][item].min_length && length(local.azdo.environment_work_item[tag][item].name) <= local.azdo.environment_work_item[tag][item].max_length
        valid_name_unique = length(regexall(local.azdo.environment_work_item[tag][item].regex, local.azdo.environment_work_item[tag][item].name_unique)) > 0 && length(local.azdo.environment_work_item[tag][item].name_unique) >= local.azdo.environment_work_item[tag][item].min_length && length(local.azdo.environment_work_item[tag][item].name_unique) <= local.azdo.environment_work_item[tag][item].max_length
      }
    } }

    environment_work_item_basic = {
      for tag in local.translated_environment_tags : tag => {
        for item in local.unique_work_items : item => {
          valid_name        = length(regexall(local.azdo.environment_work_item_basic[tag][item].regex, local.azdo.environment_work_item_basic[tag][item].name)) > 0 && length(local.azdo.environment_work_item_basic[tag][item].name) >= local.azdo.environment_work_item_basic[tag][item].min_length && length(local.azdo.environment_work_item_basic[tag][item].name) <= local.azdo.environment_work_item_basic[tag][item].max_length
          valid_name_unique = length(regexall(local.azdo.environment_work_item_basic[tag][item].regex, local.azdo.environment_work_item_basic[tag][item].name_unique)) > 0 && length(local.azdo.environment_work_item_basic[tag][item].name_unique) >= local.azdo.environment_work_item_basic[tag][item].min_length && length(local.azdo.environment_work_item_basic[tag][item].name_unique) <= local.azdo.environment_work_item_basic[tag][item].max_length
        }
      }
    }

    git_repository = local.azure_url_name_validation.git_repository

    git_repository_branch = local.git_branch_validation.git_repository_branch.default

    git_repository_bug_branch_dash = local.git_branch_validation.git_repository_bug_branch_dash

    git_repository_bug_branch_slash = local.git_branch_validation.git_repository_bug_branch_slash

    git_repository_dev_branch_dash = local.git_branch_validation.git_repository_dev_branch_dash

    git_repository_dev_branch_slash = local.git_branch_validation.git_repository_dev_branch_slash

    git_repository_development_branch_dash = local.git_branch_validation.git_repository_development_branch_dash

    git_repository_development_branch_slash = local.git_branch_validation.git_repository_development_branch_slash

    git_repository_feature_branch_dash = local.git_branch_validation.git_repository_feature_branch_dash

    git_repository_feature_branch_slash = local.git_branch_validation.git_repository_feature_branch_slash

    git_repository_fix_branch_dash = local.git_branch_validation.git_repository_fix_branch_dash

    git_repository_fix_branch_slash = local.git_branch_validation.git_repository_fix_branch_slash

    git_repository_hotfix_branch_dash = local.git_branch_validation.git_repository_hotfix_branch_dash

    git_repository_hotfix_branch_slash = local.git_branch_validation.git_repository_hotfix_branch_slash

    git_repository_release_branch_dash = local.git_branch_validation.git_repository_release_branch_dash

    git_repository_release_branch_slash = local.git_branch_validation.git_repository_release_branch_slash

    git_repository_support_branch_dash = local.git_branch_validation.git_repository_support_branch_dash

    git_repository_support_branch_slash = local.git_branch_validation.git_repository_support_branch_slash
    group = {
      valid_name        = length(regexall(local.azdo.group.regex, local.azdo.group.name)) > 0 && length(local.azdo.group.name) >= local.azdo.group.min_length && length(local.azdo.group.name) <= local.azdo.group.max_length && !endswith(local.azdo.group.name, ".")
      valid_name_unique = length(regexall(local.azdo.group.regex, local.azdo.group.name_unique)) > 0 && length(local.azdo.group.name_unique) >= local.azdo.group.min_length && length(local.azdo.group.name_unique) <= local.azdo.group.max_length && !endswith(local.azdo.group.name_unique, ".")
    }

    project = local.azure_url_name_validation.project

    serviceendpoint_argocd = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_argocd.regex, local.azdo.serviceendpoint_argocd.name)) > 0 && length(local.azdo.serviceendpoint_argocd.name) >= local.azdo.serviceendpoint_argocd.min_length && length(local.azdo.serviceendpoint_argocd.name) <= local.azdo.serviceendpoint_argocd.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_argocd.regex, local.azdo.serviceendpoint_argocd.name_unique)) > 0 && length(local.azdo.serviceendpoint_argocd.name_unique) >= local.azdo.serviceendpoint_argocd.min_length && length(local.azdo.serviceendpoint_argocd.name_unique) <= local.azdo.serviceendpoint_argocd.max_length
    }

    serviceendpoint_artifactory = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_artifactory.regex, local.azdo.serviceendpoint_artifactory.name)) > 0 && length(local.azdo.serviceendpoint_artifactory.name) >= local.azdo.serviceendpoint_artifactory.min_length && length(local.azdo.serviceendpoint_artifactory.name) <= local.azdo.serviceendpoint_artifactory.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_artifactory.regex, local.azdo.serviceendpoint_artifactory.name_unique)) > 0 && length(local.azdo.serviceendpoint_artifactory.name_unique) >= local.azdo.serviceendpoint_artifactory.min_length && length(local.azdo.serviceendpoint_artifactory.name_unique) <= local.azdo.serviceendpoint_artifactory.max_length
    }

    serviceendpoint_aws = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_aws.regex, local.azdo.serviceendpoint_aws.name)) > 0 && length(local.azdo.serviceendpoint_aws.name) >= local.azdo.serviceendpoint_aws.min_length && length(local.azdo.serviceendpoint_aws.name) <= local.azdo.serviceendpoint_aws.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_aws.regex, local.azdo.serviceendpoint_aws.name_unique)) > 0 && length(local.azdo.serviceendpoint_aws.name_unique) >= local.azdo.serviceendpoint_aws.min_length && length(local.azdo.serviceendpoint_aws.name_unique) <= local.azdo.serviceendpoint_aws.max_length
    }

    serviceendpoint_azurecr = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_azurecr.regex, local.azdo.serviceendpoint_azurecr.name)) > 0 && length(local.azdo.serviceendpoint_azurecr.name) >= local.azdo.serviceendpoint_azurecr.min_length && length(local.azdo.serviceendpoint_azurecr.name) <= local.azdo.serviceendpoint_azurecr.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_azurecr.regex, local.azdo.serviceendpoint_azurecr.name_unique)) > 0 && length(local.azdo.serviceendpoint_azurecr.name_unique) >= local.azdo.serviceendpoint_azurecr.min_length && length(local.azdo.serviceendpoint_azurecr.name_unique) <= local.azdo.serviceendpoint_azurecr.max_length
    }

    serviceendpoint_azuredevops = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_azuredevops.regex, local.azdo.serviceendpoint_azuredevops.name)) > 0 && length(local.azdo.serviceendpoint_azuredevops.name) >= local.azdo.serviceendpoint_azuredevops.min_length && length(local.azdo.serviceendpoint_azuredevops.name) <= local.azdo.serviceendpoint_azuredevops.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_azuredevops.regex, local.azdo.serviceendpoint_azuredevops.name_unique)) > 0 && length(local.azdo.serviceendpoint_azuredevops.name_unique) >= local.azdo.serviceendpoint_azuredevops.min_length && length(local.azdo.serviceendpoint_azuredevops.name_unique) <= local.azdo.serviceendpoint_azuredevops.max_length
    }

    serviceendpoint_azurerm = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_azurerm.regex, local.azdo.serviceendpoint_azurerm.name)) > 0 && length(local.azdo.serviceendpoint_azurerm.name) >= local.azdo.serviceendpoint_azurerm.min_length && length(local.azdo.serviceendpoint_azurerm.name) <= local.azdo.serviceendpoint_azurerm.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_azurerm.regex, local.azdo.serviceendpoint_azurerm.name_unique)) > 0 && length(local.azdo.serviceendpoint_azurerm.name_unique) >= local.azdo.serviceendpoint_azurerm.min_length && length(local.azdo.serviceendpoint_azurerm.name_unique) <= local.azdo.serviceendpoint_azurerm.max_length
    }

    serviceendpoint_bitbucket = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_bitbucket.regex, local.azdo.serviceendpoint_bitbucket.name)) > 0 && length(local.azdo.serviceendpoint_bitbucket.name) >= local.azdo.serviceendpoint_bitbucket.min_length && length(local.azdo.serviceendpoint_bitbucket.name) <= local.azdo.serviceendpoint_bitbucket.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_bitbucket.regex, local.azdo.serviceendpoint_bitbucket.name_unique)) > 0 && length(local.azdo.serviceendpoint_bitbucket.name_unique) >= local.azdo.serviceendpoint_bitbucket.min_length && length(local.azdo.serviceendpoint_bitbucket.name_unique) <= local.azdo.serviceendpoint_bitbucket.max_length
    }

    serviceendpoint_dockerregistry = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_dockerregistry.regex, local.azdo.serviceendpoint_dockerregistry.name)) > 0 && length(local.azdo.serviceendpoint_dockerregistry.name) >= local.azdo.serviceendpoint_dockerregistry.min_length && length(local.azdo.serviceendpoint_dockerregistry.name) <= local.azdo.serviceendpoint_dockerregistry.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_dockerregistry.regex, local.azdo.serviceendpoint_dockerregistry.name_unique)) > 0 && length(local.azdo.serviceendpoint_dockerregistry.name_unique) >= local.azdo.serviceendpoint_dockerregistry.min_length && length(local.azdo.serviceendpoint_dockerregistry.name_unique) <= local.azdo.serviceendpoint_dockerregistry.max_length
    }

    serviceendpoint_externaltfs = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_externaltfs.regex, local.azdo.serviceendpoint_externaltfs.name)) > 0 && length(local.azdo.serviceendpoint_externaltfs.name) >= local.azdo.serviceendpoint_externaltfs.min_length && length(local.azdo.serviceendpoint_externaltfs.name) <= local.azdo.serviceendpoint_externaltfs.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_externaltfs.regex, local.azdo.serviceendpoint_externaltfs.name_unique)) > 0 && length(local.azdo.serviceendpoint_externaltfs.name_unique) >= local.azdo.serviceendpoint_externaltfs.min_length && length(local.azdo.serviceendpoint_externaltfs.name_unique) <= local.azdo.serviceendpoint_externaltfs.max_length
    }

    serviceendpoint_gcp_terraform = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_gcp_terraform.regex, local.azdo.serviceendpoint_gcp_terraform.name)) > 0 && length(local.azdo.serviceendpoint_gcp_terraform.name) >= local.azdo.serviceendpoint_gcp_terraform.min_length && length(local.azdo.serviceendpoint_gcp_terraform.name) <= local.azdo.serviceendpoint_gcp_terraform.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_gcp_terraform.regex, local.azdo.serviceendpoint_gcp_terraform.name_unique)) > 0 && length(local.azdo.serviceendpoint_gcp_terraform.name_unique) >= local.azdo.serviceendpoint_gcp_terraform.min_length && length(local.azdo.serviceendpoint_gcp_terraform.name_unique) <= local.azdo.serviceendpoint_gcp_terraform.max_length
    }

    serviceendpoint_generic = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_generic.regex, local.azdo.serviceendpoint_generic.name)) > 0 && length(local.azdo.serviceendpoint_generic.name) >= local.azdo.serviceendpoint_generic.min_length && length(local.azdo.serviceendpoint_generic.name) <= local.azdo.serviceendpoint_generic.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_generic.regex, local.azdo.serviceendpoint_generic.name_unique)) > 0 && length(local.azdo.serviceendpoint_generic.name_unique) >= local.azdo.serviceendpoint_generic.min_length && length(local.azdo.serviceendpoint_generic.name_unique) <= local.azdo.serviceendpoint_generic.max_length
    }

    serviceendpoint_generic_git = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_generic_git.regex, local.azdo.serviceendpoint_generic_git.name)) > 0 && length(local.azdo.serviceendpoint_generic_git.name) >= local.azdo.serviceendpoint_generic_git.min_length && length(local.azdo.serviceendpoint_generic_git.name) <= local.azdo.serviceendpoint_generic_git.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_generic_git.regex, local.azdo.serviceendpoint_generic_git.name_unique)) > 0 && length(local.azdo.serviceendpoint_generic_git.name_unique) >= local.azdo.serviceendpoint_generic_git.min_length && length(local.azdo.serviceendpoint_generic_git.name_unique) <= local.azdo.serviceendpoint_generic_git.max_length
    }

    serviceendpoint_github = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_github.regex, local.azdo.serviceendpoint_github.name)) > 0 && length(local.azdo.serviceendpoint_github.name) >= local.azdo.serviceendpoint_github.min_length && length(local.azdo.serviceendpoint_github.name) <= local.azdo.serviceendpoint_github.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_github.regex, local.azdo.serviceendpoint_github.name_unique)) > 0 && length(local.azdo.serviceendpoint_github.name_unique) >= local.azdo.serviceendpoint_github.min_length && length(local.azdo.serviceendpoint_github.name_unique) <= local.azdo.serviceendpoint_github.max_length
    }

    serviceendpoint_github_enterprise = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_github_enterprise.regex, local.azdo.serviceendpoint_github_enterprise.name)) > 0 && length(local.azdo.serviceendpoint_github_enterprise.name) >= local.azdo.serviceendpoint_github_enterprise.min_length && length(local.azdo.serviceendpoint_github_enterprise.name) <= local.azdo.serviceendpoint_github_enterprise.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_github_enterprise.regex, local.azdo.serviceendpoint_github_enterprise.name_unique)) > 0 && length(local.azdo.serviceendpoint_github_enterprise.name_unique) >= local.azdo.serviceendpoint_github_enterprise.min_length && length(local.azdo.serviceendpoint_github_enterprise.name_unique) <= local.azdo.serviceendpoint_github_enterprise.max_length
    }

    serviceendpoint_incomingwebhook = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_incomingwebhook.regex, local.azdo.serviceendpoint_incomingwebhook.name)) > 0 && length(local.azdo.serviceendpoint_incomingwebhook.name) >= local.azdo.serviceendpoint_incomingwebhook.min_length && length(local.azdo.serviceendpoint_incomingwebhook.name) <= local.azdo.serviceendpoint_incomingwebhook.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_incomingwebhook.regex, local.azdo.serviceendpoint_incomingwebhook.name_unique)) > 0 && length(local.azdo.serviceendpoint_incomingwebhook.name_unique) >= local.azdo.serviceendpoint_incomingwebhook.min_length && length(local.azdo.serviceendpoint_incomingwebhook.name_unique) <= local.azdo.serviceendpoint_incomingwebhook.max_length
    }

    serviceendpoint_jenkins = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_jenkins.regex, local.azdo.serviceendpoint_jenkins.name)) > 0 && length(local.azdo.serviceendpoint_jenkins.name) >= local.azdo.serviceendpoint_jenkins.min_length && length(local.azdo.serviceendpoint_jenkins.name) <= local.azdo.serviceendpoint_jenkins.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_jenkins.regex, local.azdo.serviceendpoint_jenkins.name_unique)) > 0 && length(local.azdo.serviceendpoint_jenkins.name_unique) >= local.azdo.serviceendpoint_jenkins.min_length && length(local.azdo.serviceendpoint_jenkins.name_unique) <= local.azdo.serviceendpoint_jenkins.max_length
    }

    serviceendpoint_jfrog_artifactory_v2 = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_jfrog_artifactory_v2.regex, local.azdo.serviceendpoint_jfrog_artifactory_v2.name)) > 0 && length(local.azdo.serviceendpoint_jfrog_artifactory_v2.name) >= local.azdo.serviceendpoint_jfrog_artifactory_v2.min_length && length(local.azdo.serviceendpoint_jfrog_artifactory_v2.name) <= local.azdo.serviceendpoint_jfrog_artifactory_v2.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_jfrog_artifactory_v2.regex, local.azdo.serviceendpoint_jfrog_artifactory_v2.name_unique)) > 0 && length(local.azdo.serviceendpoint_jfrog_artifactory_v2.name_unique) >= local.azdo.serviceendpoint_jfrog_artifactory_v2.min_length && length(local.azdo.serviceendpoint_jfrog_artifactory_v2.name_unique) <= local.azdo.serviceendpoint_jfrog_artifactory_v2.max_length
    }

    serviceendpoint_jfrog_distribution_v2 = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_jfrog_distribution_v2.regex, local.azdo.serviceendpoint_jfrog_distribution_v2.name)) > 0 && length(local.azdo.serviceendpoint_jfrog_distribution_v2.name) >= local.azdo.serviceendpoint_jfrog_distribution_v2.min_length && length(local.azdo.serviceendpoint_jfrog_distribution_v2.name) <= local.azdo.serviceendpoint_jfrog_distribution_v2.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_jfrog_distribution_v2.regex, local.azdo.serviceendpoint_jfrog_distribution_v2.name_unique)) > 0 && length(local.azdo.serviceendpoint_jfrog_distribution_v2.name_unique) >= local.azdo.serviceendpoint_jfrog_distribution_v2.min_length && length(local.azdo.serviceendpoint_jfrog_distribution_v2.name_unique) <= local.azdo.serviceendpoint_jfrog_distribution_v2.max_length
    }

    serviceendpoint_jfrog_platform_v2 = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_jfrog_platform_v2.regex, local.azdo.serviceendpoint_jfrog_platform_v2.name)) > 0 && length(local.azdo.serviceendpoint_jfrog_platform_v2.name) >= local.azdo.serviceendpoint_jfrog_platform_v2.min_length && length(local.azdo.serviceendpoint_jfrog_platform_v2.name) <= local.azdo.serviceendpoint_jfrog_platform_v2.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_jfrog_platform_v2.regex, local.azdo.serviceendpoint_jfrog_platform_v2.name_unique)) > 0 && length(local.azdo.serviceendpoint_jfrog_platform_v2.name_unique) >= local.azdo.serviceendpoint_jfrog_platform_v2.min_length && length(local.azdo.serviceendpoint_jfrog_platform_v2.name_unique) <= local.azdo.serviceendpoint_jfrog_platform_v2.max_length
    }

    serviceendpoint_jfrog_xray_v2 = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_jfrog_xray_v2.regex, local.azdo.serviceendpoint_jfrog_xray_v2.name)) > 0 && length(local.azdo.serviceendpoint_jfrog_xray_v2.name) >= local.azdo.serviceendpoint_jfrog_xray_v2.min_length && length(local.azdo.serviceendpoint_jfrog_xray_v2.name) <= local.azdo.serviceendpoint_jfrog_xray_v2.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_jfrog_xray_v2.regex, local.azdo.serviceendpoint_jfrog_xray_v2.name_unique)) > 0 && length(local.azdo.serviceendpoint_jfrog_xray_v2.name_unique) >= local.azdo.serviceendpoint_jfrog_xray_v2.min_length && length(local.azdo.serviceendpoint_jfrog_xray_v2.name_unique) <= local.azdo.serviceendpoint_jfrog_xray_v2.max_length
    }

    serviceendpoint_kubernetes = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_kubernetes.regex, local.azdo.serviceendpoint_kubernetes.name)) > 0 && length(local.azdo.serviceendpoint_kubernetes.name) >= local.azdo.serviceendpoint_kubernetes.min_length && length(local.azdo.serviceendpoint_kubernetes.name) <= local.azdo.serviceendpoint_kubernetes.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_kubernetes.regex, local.azdo.serviceendpoint_kubernetes.name_unique)) > 0 && length(local.azdo.serviceendpoint_kubernetes.name_unique) >= local.azdo.serviceendpoint_kubernetes.min_length && length(local.azdo.serviceendpoint_kubernetes.name_unique) <= local.azdo.serviceendpoint_kubernetes.max_length
    }

    serviceendpoint_maven = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_maven.regex, local.azdo.serviceendpoint_maven.name)) > 0 && length(local.azdo.serviceendpoint_maven.name) >= local.azdo.serviceendpoint_maven.min_length && length(local.azdo.serviceendpoint_maven.name) <= local.azdo.serviceendpoint_maven.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_maven.regex, local.azdo.serviceendpoint_maven.name_unique)) > 0 && length(local.azdo.serviceendpoint_maven.name_unique) >= local.azdo.serviceendpoint_maven.min_length && length(local.azdo.serviceendpoint_maven.name_unique) <= local.azdo.serviceendpoint_maven.max_length
    }

    serviceendpoint_nexus = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_nexus.regex, local.azdo.serviceendpoint_nexus.name)) > 0 && length(local.azdo.serviceendpoint_nexus.name) >= local.azdo.serviceendpoint_nexus.min_length && length(local.azdo.serviceendpoint_nexus.name) <= local.azdo.serviceendpoint_nexus.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_nexus.regex, local.azdo.serviceendpoint_nexus.name_unique)) > 0 && length(local.azdo.serviceendpoint_nexus.name_unique) >= local.azdo.serviceendpoint_nexus.min_length && length(local.azdo.serviceendpoint_nexus.name_unique) <= local.azdo.serviceendpoint_nexus.max_length
    }

    serviceendpoint_npm = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_npm.regex, local.azdo.serviceendpoint_npm.name)) > 0 && length(local.azdo.serviceendpoint_npm.name) >= local.azdo.serviceendpoint_npm.min_length && length(local.azdo.serviceendpoint_npm.name) <= local.azdo.serviceendpoint_npm.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_npm.regex, local.azdo.serviceendpoint_npm.name_unique)) > 0 && length(local.azdo.serviceendpoint_npm.name_unique) >= local.azdo.serviceendpoint_npm.min_length && length(local.azdo.serviceendpoint_npm.name_unique) <= local.azdo.serviceendpoint_npm.max_length
    }

    serviceendpoint_nuget = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_nuget.regex, local.azdo.serviceendpoint_nuget.name)) > 0 && length(local.azdo.serviceendpoint_nuget.name) >= local.azdo.serviceendpoint_nuget.min_length && length(local.azdo.serviceendpoint_nuget.name) <= local.azdo.serviceendpoint_nuget.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_nuget.regex, local.azdo.serviceendpoint_nuget.name_unique)) > 0 && length(local.azdo.serviceendpoint_nuget.name_unique) >= local.azdo.serviceendpoint_nuget.min_length && length(local.azdo.serviceendpoint_nuget.name_unique) <= local.azdo.serviceendpoint_nuget.max_length
    }

    serviceendpoint_octopusdeploy = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_octopusdeploy.regex, local.azdo.serviceendpoint_octopusdeploy.name)) > 0 && length(local.azdo.serviceendpoint_octopusdeploy.name) >= local.azdo.serviceendpoint_octopusdeploy.min_length && length(local.azdo.serviceendpoint_octopusdeploy.name) <= local.azdo.serviceendpoint_octopusdeploy.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_octopusdeploy.regex, local.azdo.serviceendpoint_octopusdeploy.name_unique)) > 0 && length(local.azdo.serviceendpoint_octopusdeploy.name_unique) >= local.azdo.serviceendpoint_octopusdeploy.min_length && length(local.azdo.serviceendpoint_octopusdeploy.name_unique) <= local.azdo.serviceendpoint_octopusdeploy.max_length
    }

    serviceendpoint_runpipeline = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_runpipeline.regex, local.azdo.serviceendpoint_runpipeline.name)) > 0 && length(local.azdo.serviceendpoint_runpipeline.name) >= local.azdo.serviceendpoint_runpipeline.min_length && length(local.azdo.serviceendpoint_runpipeline.name) <= local.azdo.serviceendpoint_runpipeline.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_runpipeline.regex, local.azdo.serviceendpoint_runpipeline.name_unique)) > 0 && length(local.azdo.serviceendpoint_runpipeline.name_unique) >= local.azdo.serviceendpoint_runpipeline.min_length && length(local.azdo.serviceendpoint_runpipeline.name_unique) <= local.azdo.serviceendpoint_runpipeline.max_length
    }

    serviceendpoint_servicefabric = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_servicefabric.regex, local.azdo.serviceendpoint_servicefabric.name)) > 0 && length(local.azdo.serviceendpoint_servicefabric.name) >= local.azdo.serviceendpoint_servicefabric.min_length && length(local.azdo.serviceendpoint_servicefabric.name) <= local.azdo.serviceendpoint_servicefabric.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_servicefabric.regex, local.azdo.serviceendpoint_servicefabric.name_unique)) > 0 && length(local.azdo.serviceendpoint_servicefabric.name_unique) >= local.azdo.serviceendpoint_servicefabric.min_length && length(local.azdo.serviceendpoint_servicefabric.name_unique) <= local.azdo.serviceendpoint_servicefabric.max_length
    }

    serviceendpoint_sonarcloud = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_sonarcloud.regex, local.azdo.serviceendpoint_sonarcloud.name)) > 0 && length(local.azdo.serviceendpoint_sonarcloud.name) >= local.azdo.serviceendpoint_sonarcloud.min_length && length(local.azdo.serviceendpoint_sonarcloud.name) <= local.azdo.serviceendpoint_sonarcloud.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_sonarcloud.regex, local.azdo.serviceendpoint_sonarcloud.name_unique)) > 0 && length(local.azdo.serviceendpoint_sonarcloud.name_unique) >= local.azdo.serviceendpoint_sonarcloud.min_length && length(local.azdo.serviceendpoint_sonarcloud.name_unique) <= local.azdo.serviceendpoint_sonarcloud.max_length
    }

    serviceendpoint_sonarqube = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_sonarqube.regex, local.azdo.serviceendpoint_sonarqube.name)) > 0 && length(local.azdo.serviceendpoint_sonarqube.name) >= local.azdo.serviceendpoint_sonarqube.min_length && length(local.azdo.serviceendpoint_sonarqube.name) <= local.azdo.serviceendpoint_sonarqube.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_sonarqube.regex, local.azdo.serviceendpoint_sonarqube.name_unique)) > 0 && length(local.azdo.serviceendpoint_sonarqube.name_unique) >= local.azdo.serviceendpoint_sonarqube.min_length && length(local.azdo.serviceendpoint_sonarqube.name_unique) <= local.azdo.serviceendpoint_sonarqube.max_length
    }

    serviceendpoint_ssh = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_ssh.regex, local.azdo.serviceendpoint_ssh.name)) > 0 && length(local.azdo.serviceendpoint_ssh.name) >= local.azdo.serviceendpoint_ssh.min_length && length(local.azdo.serviceendpoint_ssh.name) <= local.azdo.serviceendpoint_ssh.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_ssh.regex, local.azdo.serviceendpoint_ssh.name_unique)) > 0 && length(local.azdo.serviceendpoint_ssh.name_unique) >= local.azdo.serviceendpoint_ssh.min_length && length(local.azdo.serviceendpoint_ssh.name_unique) <= local.azdo.serviceendpoint_ssh.max_length
    }

    serviceendpoint_azure_service_bus = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_azure_service_bus.regex, local.azdo.serviceendpoint_azure_service_bus.name)) > 0 && length(local.azdo.serviceendpoint_azure_service_bus.name) >= local.azdo.serviceendpoint_azure_service_bus.min_length && length(local.azdo.serviceendpoint_azure_service_bus.name) <= local.azdo.serviceendpoint_azure_service_bus.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_azure_service_bus.regex, local.azdo.serviceendpoint_azure_service_bus.name_unique)) > 0 && length(local.azdo.serviceendpoint_azure_service_bus.name_unique) >= local.azdo.serviceendpoint_azure_service_bus.min_length && length(local.azdo.serviceendpoint_azure_service_bus.name_unique) <= local.azdo.serviceendpoint_azure_service_bus.max_length
    }

    serviceendpoint_black_duck = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_black_duck.regex, local.azdo.serviceendpoint_black_duck.name)) > 0 && length(local.azdo.serviceendpoint_black_duck.name) >= local.azdo.serviceendpoint_black_duck.min_length && length(local.azdo.serviceendpoint_black_duck.name) <= local.azdo.serviceendpoint_black_duck.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_black_duck.regex, local.azdo.serviceendpoint_black_duck.name_unique)) > 0 && length(local.azdo.serviceendpoint_black_duck.name_unique) >= local.azdo.serviceendpoint_black_duck.min_length && length(local.azdo.serviceendpoint_black_duck.name_unique) <= local.azdo.serviceendpoint_black_duck.max_length
    }

    serviceendpoint_checkmarx_one = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_checkmarx_one.regex, local.azdo.serviceendpoint_checkmarx_one.name)) > 0 && length(local.azdo.serviceendpoint_checkmarx_one.name) >= local.azdo.serviceendpoint_checkmarx_one.min_length && length(local.azdo.serviceendpoint_checkmarx_one.name) <= local.azdo.serviceendpoint_checkmarx_one.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_checkmarx_one.regex, local.azdo.serviceendpoint_checkmarx_one.name_unique)) > 0 && length(local.azdo.serviceendpoint_checkmarx_one.name_unique) >= local.azdo.serviceendpoint_checkmarx_one.min_length && length(local.azdo.serviceendpoint_checkmarx_one.name_unique) <= local.azdo.serviceendpoint_checkmarx_one.max_length
    }

    serviceendpoint_checkmarx_sast = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_checkmarx_sast.regex, local.azdo.serviceendpoint_checkmarx_sast.name)) > 0 && length(local.azdo.serviceendpoint_checkmarx_sast.name) >= local.azdo.serviceendpoint_checkmarx_sast.min_length && length(local.azdo.serviceendpoint_checkmarx_sast.name) <= local.azdo.serviceendpoint_checkmarx_sast.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_checkmarx_sast.regex, local.azdo.serviceendpoint_checkmarx_sast.name_unique)) > 0 && length(local.azdo.serviceendpoint_checkmarx_sast.name_unique) >= local.azdo.serviceendpoint_checkmarx_sast.min_length && length(local.azdo.serviceendpoint_checkmarx_sast.name_unique) <= local.azdo.serviceendpoint_checkmarx_sast.max_length
    }

    serviceendpoint_checkmarx_sca = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_checkmarx_sca.regex, local.azdo.serviceendpoint_checkmarx_sca.name)) > 0 && length(local.azdo.serviceendpoint_checkmarx_sca.name) >= local.azdo.serviceendpoint_checkmarx_sca.min_length && length(local.azdo.serviceendpoint_checkmarx_sca.name) <= local.azdo.serviceendpoint_checkmarx_sca.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_checkmarx_sca.regex, local.azdo.serviceendpoint_checkmarx_sca.name_unique)) > 0 && length(local.azdo.serviceendpoint_checkmarx_sca.name_unique) >= local.azdo.serviceendpoint_checkmarx_sca.min_length && length(local.azdo.serviceendpoint_checkmarx_sca.name_unique) <= local.azdo.serviceendpoint_checkmarx_sca.max_length
    }

    serviceendpoint_dynamics_lifecycle_services = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_dynamics_lifecycle_services.regex, local.azdo.serviceendpoint_dynamics_lifecycle_services.name)) > 0 && length(local.azdo.serviceendpoint_dynamics_lifecycle_services.name) >= local.azdo.serviceendpoint_dynamics_lifecycle_services.min_length && length(local.azdo.serviceendpoint_dynamics_lifecycle_services.name) <= local.azdo.serviceendpoint_dynamics_lifecycle_services.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_dynamics_lifecycle_services.regex, local.azdo.serviceendpoint_dynamics_lifecycle_services.name_unique)) > 0 && length(local.azdo.serviceendpoint_dynamics_lifecycle_services.name_unique) >= local.azdo.serviceendpoint_dynamics_lifecycle_services.min_length && length(local.azdo.serviceendpoint_dynamics_lifecycle_services.name_unique) <= local.azdo.serviceendpoint_dynamics_lifecycle_services.max_length
    }

    serviceendpoint_generic_v2 = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_generic_v2.regex, local.azdo.serviceendpoint_generic_v2.name)) > 0 && length(local.azdo.serviceendpoint_generic_v2.name) >= local.azdo.serviceendpoint_generic_v2.min_length && length(local.azdo.serviceendpoint_generic_v2.name) <= local.azdo.serviceendpoint_generic_v2.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_generic_v2.regex, local.azdo.serviceendpoint_generic_v2.name_unique)) > 0 && length(local.azdo.serviceendpoint_generic_v2.name_unique) >= local.azdo.serviceendpoint_generic_v2.min_length && length(local.azdo.serviceendpoint_generic_v2.name_unique) <= local.azdo.serviceendpoint_generic_v2.max_length
    }

    serviceendpoint_gitlab = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_gitlab.regex, local.azdo.serviceendpoint_gitlab.name)) > 0 && length(local.azdo.serviceendpoint_gitlab.name) >= local.azdo.serviceendpoint_gitlab.min_length && length(local.azdo.serviceendpoint_gitlab.name) <= local.azdo.serviceendpoint_gitlab.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_gitlab.regex, local.azdo.serviceendpoint_gitlab.name_unique)) > 0 && length(local.azdo.serviceendpoint_gitlab.name_unique) >= local.azdo.serviceendpoint_gitlab.min_length && length(local.azdo.serviceendpoint_gitlab.name_unique) <= local.azdo.serviceendpoint_gitlab.max_length
    }

    serviceendpoint_openshift = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_openshift.regex, local.azdo.serviceendpoint_openshift.name)) > 0 && length(local.azdo.serviceendpoint_openshift.name) >= local.azdo.serviceendpoint_openshift.min_length && length(local.azdo.serviceendpoint_openshift.name) <= local.azdo.serviceendpoint_openshift.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_openshift.regex, local.azdo.serviceendpoint_openshift.name_unique)) > 0 && length(local.azdo.serviceendpoint_openshift.name_unique) >= local.azdo.serviceendpoint_openshift.min_length && length(local.azdo.serviceendpoint_openshift.name_unique) <= local.azdo.serviceendpoint_openshift.max_length
    }

    serviceendpoint_snyk = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_snyk.regex, local.azdo.serviceendpoint_snyk.name)) > 0 && length(local.azdo.serviceendpoint_snyk.name) >= local.azdo.serviceendpoint_snyk.min_length && length(local.azdo.serviceendpoint_snyk.name) <= local.azdo.serviceendpoint_snyk.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_snyk.regex, local.azdo.serviceendpoint_snyk.name_unique)) > 0 && length(local.azdo.serviceendpoint_snyk.name_unique) >= local.azdo.serviceendpoint_snyk.min_length && length(local.azdo.serviceendpoint_snyk.name_unique) <= local.azdo.serviceendpoint_snyk.max_length
    }

    serviceendpoint_visualstudiomarketplace = {
      valid_name        = length(regexall(local.azdo.serviceendpoint_visualstudiomarketplace.regex, local.azdo.serviceendpoint_visualstudiomarketplace.name)) > 0 && length(local.azdo.serviceendpoint_visualstudiomarketplace.name) >= local.azdo.serviceendpoint_visualstudiomarketplace.min_length && length(local.azdo.serviceendpoint_visualstudiomarketplace.name) <= local.azdo.serviceendpoint_visualstudiomarketplace.max_length
      valid_name_unique = length(regexall(local.azdo.serviceendpoint_visualstudiomarketplace.regex, local.azdo.serviceendpoint_visualstudiomarketplace.name_unique)) > 0 && length(local.azdo.serviceendpoint_visualstudiomarketplace.name_unique) >= local.azdo.serviceendpoint_visualstudiomarketplace.min_length && length(local.azdo.serviceendpoint_visualstudiomarketplace.name_unique) <= local.azdo.serviceendpoint_visualstudiomarketplace.max_length
    }


    team = local.azure_url_name_validation.team

    variable_group = {
      valid_name        = length(regexall(local.azdo.variable_group.regex, local.azdo.variable_group.name)) > 0 && length(local.azdo.variable_group.name) >= local.azdo.variable_group.min_length && length(local.azdo.variable_group.name) <= local.azdo.variable_group.max_length
      valid_name_unique = length(regexall(local.azdo.variable_group.regex, local.azdo.variable_group.name_unique)) > 0 && length(local.azdo.variable_group.name_unique) >= local.azdo.variable_group.min_length && length(local.azdo.variable_group.name_unique) <= local.azdo.variable_group.max_length
    }

    agent_queue = {
      valid_name        = length(regexall(local.azdo.agent_queue.regex, local.azdo.agent_queue.name)) > 0 && length(local.azdo.agent_queue.name) >= local.azdo.agent_queue.min_length && length(local.azdo.agent_queue.name) <= local.azdo.agent_queue.max_length
      valid_name_unique = length(regexall(local.azdo.agent_queue.regex, local.azdo.agent_queue.name_unique)) > 0 && length(local.azdo.agent_queue.name_unique) >= local.azdo.agent_queue.min_length && length(local.azdo.agent_queue.name_unique) <= local.azdo.agent_queue.max_length
    }

    dashboard = {
      valid_name        = length(regexall(local.azdo.dashboard.regex, local.azdo.dashboard.name)) > 0 && length(local.azdo.dashboard.name) >= local.azdo.dashboard.min_length && length(local.azdo.dashboard.name) <= local.azdo.dashboard.max_length
      valid_name_unique = length(regexall(local.azdo.dashboard.regex, local.azdo.dashboard.name_unique)) > 0 && length(local.azdo.dashboard.name_unique) >= local.azdo.dashboard.min_length && length(local.azdo.dashboard.name_unique) <= local.azdo.dashboard.max_length
    }

    deployment_group = {
      valid_name        = length(regexall(local.azdo.deployment_group.regex, local.azdo.deployment_group.name)) > 0 && length(local.azdo.deployment_group.name) >= local.azdo.deployment_group.min_length && length(local.azdo.deployment_group.name) <= local.azdo.deployment_group.max_length
      valid_name_unique = length(regexall(local.azdo.deployment_group.regex, local.azdo.deployment_group.name_unique)) > 0 && length(local.azdo.deployment_group.name_unique) >= local.azdo.deployment_group.min_length && length(local.azdo.deployment_group.name_unique) <= local.azdo.deployment_group.max_length
    }

    environment_kubernetes_resource = {
      valid_name        = length(regexall(local.azdo.environment_kubernetes_resource.regex, local.azdo.environment_kubernetes_resource.name)) > 0 && length(local.azdo.environment_kubernetes_resource.name) >= local.azdo.environment_kubernetes_resource.min_length && length(local.azdo.environment_kubernetes_resource.name) <= local.azdo.environment_kubernetes_resource.max_length
      valid_name_unique = length(regexall(local.azdo.environment_kubernetes_resource.regex, local.azdo.environment_kubernetes_resource.name_unique)) > 0 && length(local.azdo.environment_kubernetes_resource.name_unique) >= local.azdo.environment_kubernetes_resource.min_length && length(local.azdo.environment_kubernetes_resource.name_unique) <= local.azdo.environment_kubernetes_resource.max_length
    }

    feed = {
      valid_name        = length(regexall(local.azdo.feed.regex, local.azdo.feed.name)) > 0 && length(local.azdo.feed.name) >= local.azdo.feed.min_length && length(local.azdo.feed.name) <= local.azdo.feed.max_length && can(regex("^[A-Za-z0-9]", local.azdo.feed.name)) && can(regex("[A-Za-z0-9]$", local.azdo.feed.name))
      valid_name_unique = length(regexall(local.azdo.feed.regex, local.azdo.feed.name_unique)) > 0 && length(local.azdo.feed.name_unique) >= local.azdo.feed.min_length && length(local.azdo.feed.name_unique) <= local.azdo.feed.max_length && can(regex("^[A-Za-z0-9]", local.azdo.feed.name_unique)) && can(regex("[A-Za-z0-9]$", local.azdo.feed.name_unique))
    }

    variable_group_variable = local.pipeline_variable_validation.variable_group_variable

    wiki = {
      valid_name        = length(regexall(local.azdo.wiki.regex, local.azdo.wiki.name)) > 0 && length(local.azdo.wiki.name) >= local.azdo.wiki.min_length && length(local.azdo.wiki.name) <= local.azdo.wiki.max_length
      valid_name_unique = length(regexall(local.azdo.wiki.regex, local.azdo.wiki.name_unique)) > 0 && length(local.azdo.wiki.name_unique) >= local.azdo.wiki.min_length && length(local.azdo.wiki.name_unique) <= local.azdo.wiki.max_length
    }

    wiki_page = {
      valid_name        = length(regexall(local.azdo.wiki_page.regex, local.azdo.wiki_page.name)) > 0 && length(local.azdo.wiki_page.name) >= local.azdo.wiki_page.min_length && length(local.azdo.wiki_page.name) <= local.azdo.wiki_page.max_length && alltrue([for component in split("/", local.azdo.wiki_page.name) : component != "" && !startswith(component, ".") && !endswith(component, ".")])
      valid_name_unique = length(regexall(local.azdo.wiki_page.regex, local.azdo.wiki_page.name_unique)) > 0 && length(local.azdo.wiki_page.name_unique) >= local.azdo.wiki_page.min_length && length(local.azdo.wiki_page.name_unique) <= local.azdo.wiki_page.max_length && alltrue([for component in split("/", local.azdo.wiki_page.name_unique) : component != "" && !startswith(component, ".") && !endswith(component, ".")])
    }

    workitem = {
      valid_name        = length(regexall(local.azdo.workitem.regex, local.azdo.workitem.name)) > 0 && length(local.azdo.workitem.name) >= local.azdo.workitem.min_length && length(local.azdo.workitem.name) <= local.azdo.workitem.max_length
      valid_name_unique = length(regexall(local.azdo.workitem.regex, local.azdo.workitem.name_unique)) > 0 && length(local.azdo.workitem.name_unique) >= local.azdo.workitem.min_length && length(local.azdo.workitem.name_unique) <= local.azdo.workitem.max_length
    }

    workitemquery = {
      valid_name        = length(regexall(local.azdo.workitemquery.regex, local.azdo.workitemquery.name)) > 0 && length(local.azdo.workitemquery.name) >= local.azdo.workitemquery.min_length && length(local.azdo.workitemquery.name) <= local.azdo.workitemquery.max_length
      valid_name_unique = length(regexall(local.azdo.workitemquery.regex, local.azdo.workitemquery.name_unique)) > 0 && length(local.azdo.workitemquery.name_unique) >= local.azdo.workitemquery.min_length && length(local.azdo.workitemquery.name_unique) <= local.azdo.workitemquery.max_length
    }

    workitemquery_folder = {
      valid_name        = length(regexall(local.azdo.workitemquery_folder.regex, local.azdo.workitemquery_folder.name)) > 0 && length(local.azdo.workitemquery_folder.name) >= local.azdo.workitemquery_folder.min_length && length(local.azdo.workitemquery_folder.name) <= local.azdo.workitemquery_folder.max_length
      valid_name_unique = length(regexall(local.azdo.workitemquery_folder.regex, local.azdo.workitemquery_folder.name_unique)) > 0 && length(local.azdo.workitemquery_folder.name_unique) >= local.azdo.workitemquery_folder.min_length && length(local.azdo.workitemquery_folder.name_unique) <= local.azdo.workitemquery_folder.max_length
    }

    workitemtracking_field = {
      valid_name        = length(regexall(local.azdo.workitemtracking_field.regex, local.azdo.workitemtracking_field.name)) > 0 && length(local.azdo.workitemtracking_field.name) >= local.azdo.workitemtracking_field.min_length && length(local.azdo.workitemtracking_field.name) <= local.azdo.workitemtracking_field.max_length && can(regex("[A-Za-z]", local.azdo.workitemtracking_field.name)) && local.azdo.workitemtracking_field.name == trimspace(local.azdo.workitemtracking_field.name) && !strcontains(local.azdo.workitemtracking_field.name, "  ")
      valid_name_unique = length(regexall(local.azdo.workitemtracking_field.regex, local.azdo.workitemtracking_field.name_unique)) > 0 && length(local.azdo.workitemtracking_field.name_unique) >= local.azdo.workitemtracking_field.min_length && length(local.azdo.workitemtracking_field.name_unique) <= local.azdo.workitemtracking_field.max_length && can(regex("[A-Za-z]", local.azdo.workitemtracking_field.name_unique)) && local.azdo.workitemtracking_field.name_unique == trimspace(local.azdo.workitemtracking_field.name_unique) && !strcontains(local.azdo.workitemtracking_field.name_unique, "  ")
    }

    workitemtrackingprocess_process = {
      valid_name        = length(regexall(local.azdo.workitemtrackingprocess_process.regex, local.azdo.workitemtrackingprocess_process.name)) > 0 && length(local.azdo.workitemtrackingprocess_process.name) >= local.azdo.workitemtrackingprocess_process.min_length && length(local.azdo.workitemtrackingprocess_process.name) <= local.azdo.workitemtrackingprocess_process.max_length
      valid_name_unique = length(regexall(local.azdo.workitemtrackingprocess_process.regex, local.azdo.workitemtrackingprocess_process.name_unique)) > 0 && length(local.azdo.workitemtrackingprocess_process.name_unique) >= local.azdo.workitemtrackingprocess_process.min_length && length(local.azdo.workitemtrackingprocess_process.name_unique) <= local.azdo.workitemtrackingprocess_process.max_length
    }

    workitemtrackingprocess_field = {
      valid_name        = length(regexall(local.azdo.workitemtrackingprocess_field.regex, local.azdo.workitemtrackingprocess_field.name)) > 0 && length(local.azdo.workitemtrackingprocess_field.name) >= local.azdo.workitemtrackingprocess_field.min_length && length(local.azdo.workitemtrackingprocess_field.name) <= local.azdo.workitemtrackingprocess_field.max_length
      valid_name_unique = length(regexall(local.azdo.workitemtrackingprocess_field.regex, local.azdo.workitemtrackingprocess_field.name_unique)) > 0 && length(local.azdo.workitemtrackingprocess_field.name_unique) >= local.azdo.workitemtrackingprocess_field.min_length && length(local.azdo.workitemtrackingprocess_field.name_unique) <= local.azdo.workitemtrackingprocess_field.max_length
    }

    workitemtrackingprocess_group = {
      valid_name        = length(regexall(local.azdo.workitemtrackingprocess_group.regex, local.azdo.workitemtrackingprocess_group.name)) > 0 && length(local.azdo.workitemtrackingprocess_group.name) >= local.azdo.workitemtrackingprocess_group.min_length && length(local.azdo.workitemtrackingprocess_group.name) <= local.azdo.workitemtrackingprocess_group.max_length
      valid_name_unique = length(regexall(local.azdo.workitemtrackingprocess_group.regex, local.azdo.workitemtrackingprocess_group.name_unique)) > 0 && length(local.azdo.workitemtrackingprocess_group.name_unique) >= local.azdo.workitemtrackingprocess_group.min_length && length(local.azdo.workitemtrackingprocess_group.name_unique) <= local.azdo.workitemtrackingprocess_group.max_length
    }

    workitemtrackingprocess_page = {
      valid_name        = length(regexall(local.azdo.workitemtrackingprocess_page.regex, local.azdo.workitemtrackingprocess_page.name)) > 0 && length(local.azdo.workitemtrackingprocess_page.name) >= local.azdo.workitemtrackingprocess_page.min_length && length(local.azdo.workitemtrackingprocess_page.name) <= local.azdo.workitemtrackingprocess_page.max_length
      valid_name_unique = length(regexall(local.azdo.workitemtrackingprocess_page.regex, local.azdo.workitemtrackingprocess_page.name_unique)) > 0 && length(local.azdo.workitemtrackingprocess_page.name_unique) >= local.azdo.workitemtrackingprocess_page.min_length && length(local.azdo.workitemtrackingprocess_page.name_unique) <= local.azdo.workitemtrackingprocess_page.max_length
    }

    workitemtrackingprocess_state = {
      valid_name        = length(regexall(local.azdo.workitemtrackingprocess_state.regex, local.azdo.workitemtrackingprocess_state.name)) > 0 && length(local.azdo.workitemtrackingprocess_state.name) >= local.azdo.workitemtrackingprocess_state.min_length && length(local.azdo.workitemtrackingprocess_state.name) <= local.azdo.workitemtrackingprocess_state.max_length
      valid_name_unique = length(regexall(local.azdo.workitemtrackingprocess_state.regex, local.azdo.workitemtrackingprocess_state.name_unique)) > 0 && length(local.azdo.workitemtrackingprocess_state.name_unique) >= local.azdo.workitemtrackingprocess_state.min_length && length(local.azdo.workitemtrackingprocess_state.name_unique) <= local.azdo.workitemtrackingprocess_state.max_length
    }

    workitemtrackingprocess_workitemtype = {
      valid_name        = length(regexall(local.azdo.workitemtrackingprocess_workitemtype.regex, local.azdo.workitemtrackingprocess_workitemtype.name)) > 0 && length(local.azdo.workitemtrackingprocess_workitemtype.name) >= local.azdo.workitemtrackingprocess_workitemtype.min_length && length(local.azdo.workitemtrackingprocess_workitemtype.name) <= local.azdo.workitemtrackingprocess_workitemtype.max_length
      valid_name_unique = length(regexall(local.azdo.workitemtrackingprocess_workitemtype.regex, local.azdo.workitemtrackingprocess_workitemtype.name_unique)) > 0 && length(local.azdo.workitemtrackingprocess_workitemtype.name_unique) >= local.azdo.workitemtrackingprocess_workitemtype.min_length && length(local.azdo.workitemtrackingprocess_workitemtype.name_unique) <= local.azdo.workitemtrackingprocess_workitemtype.max_length
    }

    pipeline_stage = {
      valid_name        = length(regexall(local.azdo.pipeline_stage.regex, local.azdo.pipeline_stage.name)) > 0 && length(local.azdo.pipeline_stage.name) >= local.azdo.pipeline_stage.min_length && length(local.azdo.pipeline_stage.name) <= local.azdo.pipeline_stage.max_length
      valid_name_unique = length(regexall(local.azdo.pipeline_stage.regex, local.azdo.pipeline_stage.name_unique)) > 0 && length(local.azdo.pipeline_stage.name_unique) >= local.azdo.pipeline_stage.min_length && length(local.azdo.pipeline_stage.name_unique) <= local.azdo.pipeline_stage.max_length
    }

    pipeline_job = {
      valid_name        = length(regexall(local.azdo.pipeline_job.regex, local.azdo.pipeline_job.name)) > 0 && length(local.azdo.pipeline_job.name) >= local.azdo.pipeline_job.min_length && length(local.azdo.pipeline_job.name) <= local.azdo.pipeline_job.max_length && !strcontains(lower(local.azdo.pipeline_job.name), "deploy")
      valid_name_unique = length(regexall(local.azdo.pipeline_job.regex, local.azdo.pipeline_job.name_unique)) > 0 && length(local.azdo.pipeline_job.name_unique) >= local.azdo.pipeline_job.min_length && length(local.azdo.pipeline_job.name_unique) <= local.azdo.pipeline_job.max_length && !strcontains(lower(local.azdo.pipeline_job.name_unique), "deploy")
    }

    pipeline_variable = local.pipeline_variable_validation.pipeline_variable

    pipeline_matrix = {
      valid_name        = length(regexall(local.azdo.pipeline_matrix.regex, local.azdo.pipeline_matrix.name)) > 0 && length(local.azdo.pipeline_matrix.name) >= local.azdo.pipeline_matrix.min_length && length(local.azdo.pipeline_matrix.name) <= local.azdo.pipeline_matrix.max_length
      valid_name_unique = length(regexall(local.azdo.pipeline_matrix.regex, local.azdo.pipeline_matrix.name_unique)) > 0 && length(local.azdo.pipeline_matrix.name_unique) >= local.azdo.pipeline_matrix.min_length && length(local.azdo.pipeline_matrix.name_unique) <= local.azdo.pipeline_matrix.max_length
    }

    artifact_package = {
      valid_name        = length(regexall(local.azdo.artifact_package.regex, local.azdo.artifact_package.name)) > 0 && length(local.azdo.artifact_package.name) >= local.azdo.artifact_package.min_length && length(local.azdo.artifact_package.name) <= local.azdo.artifact_package.max_length && can(regex("^[a-z0-9]", local.azdo.artifact_package.name)) && can(regex("[a-z0-9]$", local.azdo.artifact_package.name)) && length(regexall("[-_.]{2}", local.azdo.artifact_package.name)) == 0
      valid_name_unique = length(regexall(local.azdo.artifact_package.regex, local.azdo.artifact_package.name_unique)) > 0 && length(local.azdo.artifact_package.name_unique) >= local.azdo.artifact_package.min_length && length(local.azdo.artifact_package.name_unique) <= local.azdo.artifact_package.max_length && can(regex("^[a-z0-9]", local.azdo.artifact_package.name_unique)) && can(regex("[a-z0-9]$", local.azdo.artifact_package.name_unique)) && length(regexall("[-_.]{2}", local.azdo.artifact_package.name_unique)) == 0
    }

    organization = {
      valid_name        = length(regexall(local.azdo.organization.regex, local.azdo.organization.name)) > 0 && length(local.azdo.organization.name) >= local.azdo.organization.min_length && length(local.azdo.organization.name) <= local.azdo.organization.max_length
      valid_name_unique = length(regexall(local.azdo.organization.regex, local.azdo.organization.name_unique)) > 0 && length(local.azdo.organization.name_unique) >= local.azdo.organization.min_length && length(local.azdo.organization.name_unique) <= local.azdo.organization.max_length
    }

    process = {
      valid_name        = length(regexall(local.azdo.process.regex, local.azdo.process.name)) > 0 && length(local.azdo.process.name) >= local.azdo.process.min_length && length(local.azdo.process.name) <= local.azdo.process.max_length
      valid_name_unique = length(regexall(local.azdo.process.regex, local.azdo.process.name_unique)) > 0 && length(local.azdo.process.name_unique) >= local.azdo.process.min_length && length(local.azdo.process.name_unique) <= local.azdo.process.max_length
    }

    security_group = {
      valid_name        = length(regexall(local.azdo.security_group.regex, local.azdo.security_group.name)) > 0 && length(local.azdo.security_group.name) >= local.azdo.security_group.min_length && length(local.azdo.security_group.name) <= local.azdo.security_group.max_length && !endswith(local.azdo.security_group.name, ".")
      valid_name_unique = length(regexall(local.azdo.security_group.regex, local.azdo.security_group.name_unique)) > 0 && length(local.azdo.security_group.name_unique) >= local.azdo.security_group.min_length && length(local.azdo.security_group.name_unique) <= local.azdo.security_group.max_length && !endswith(local.azdo.security_group.name_unique, ".")
    }

    area_path = {
      valid_name        = length(regexall(local.azdo.area_path.regex, local.azdo.area_path.name)) > 0 && length(local.azdo.area_path.name) >= local.azdo.area_path.min_length && length(local.azdo.area_path.name) <= local.azdo.area_path.max_length && !contains(local.system_reserved_names, lower(local.azdo.area_path.name)) && !contains([".", ".."], local.azdo.area_path.name) && !endswith(local.azdo.area_path.name, ".") && !endswith(local.azdo.area_path.name, " ")
      valid_name_unique = length(regexall(local.azdo.area_path.regex, local.azdo.area_path.name_unique)) > 0 && length(local.azdo.area_path.name_unique) >= local.azdo.area_path.min_length && length(local.azdo.area_path.name_unique) <= local.azdo.area_path.max_length && !contains(local.system_reserved_names, lower(local.azdo.area_path.name_unique)) && !contains([".", ".."], local.azdo.area_path.name_unique) && !endswith(local.azdo.area_path.name_unique, ".") && !endswith(local.azdo.area_path.name_unique, " ")
    }

    iteration_path = {
      valid_name        = length(regexall(local.azdo.iteration_path.regex, local.azdo.iteration_path.name)) > 0 && length(local.azdo.iteration_path.name) >= local.azdo.iteration_path.min_length && length(local.azdo.iteration_path.name) <= local.azdo.iteration_path.max_length && !contains(local.system_reserved_names, lower(local.azdo.iteration_path.name)) && !contains([".", ".."], local.azdo.iteration_path.name) && !endswith(local.azdo.iteration_path.name, ".") && !endswith(local.azdo.iteration_path.name, " ")
      valid_name_unique = length(regexall(local.azdo.iteration_path.regex, local.azdo.iteration_path.name_unique)) > 0 && length(local.azdo.iteration_path.name_unique) >= local.azdo.iteration_path.min_length && length(local.azdo.iteration_path.name_unique) <= local.azdo.iteration_path.max_length && !contains(local.system_reserved_names, lower(local.azdo.iteration_path.name_unique)) && !contains([".", ".."], local.azdo.iteration_path.name_unique) && !endswith(local.azdo.iteration_path.name_unique, ".") && !endswith(local.azdo.iteration_path.name_unique, " ")
    }

    board_column = {
      valid_name        = length(regexall(local.azdo.board_column.regex, local.azdo.board_column.name)) > 0 && length(local.azdo.board_column.name) >= local.azdo.board_column.min_length && length(local.azdo.board_column.name) <= local.azdo.board_column.max_length
      valid_name_unique = length(regexall(local.azdo.board_column.regex, local.azdo.board_column.name_unique)) > 0 && length(local.azdo.board_column.name_unique) >= local.azdo.board_column.min_length && length(local.azdo.board_column.name_unique) <= local.azdo.board_column.max_length
    }

    board_swimlane = {
      valid_name        = length(regexall(local.azdo.board_swimlane.regex, local.azdo.board_swimlane.name)) > 0 && length(local.azdo.board_swimlane.name) >= local.azdo.board_swimlane.min_length && length(local.azdo.board_swimlane.name) <= local.azdo.board_swimlane.max_length
      valid_name_unique = length(regexall(local.azdo.board_swimlane.regex, local.azdo.board_swimlane.name_unique)) > 0 && length(local.azdo.board_swimlane.name_unique) >= local.azdo.board_swimlane.min_length && length(local.azdo.board_swimlane.name_unique) <= local.azdo.board_swimlane.max_length
    }

  }
}
