##############################################################
#######               Main Resources                   #######
##############################################################

resource "random_string" "main" {
  length  = 60
  special = false
  upper   = false
  numeric = var.unique_include_numbers
}

resource "random_string" "first_letter" {
  length  = 1
  special = false
  upper   = false
  numeric = false
}

##############################################################
#######                LOCALS                          #######
##############################################################

locals {
  ## adding a first letter to guarantee that you always start with a letter
  random_safe_generation = join("", [random_string.first_letter.result, random_string.main.result])
  random                 = substr(coalesce(var.unique_seed, local.random_safe_generation), 0, var.unique_length)
  prefix_parts           = compact(var.prefix)
  suffix_parts           = compact(var.suffix)
  prefix                 = join("-", local.prefix_parts)
  prefix_safe            = lower(join("", local.prefix_parts))
  suffix                 = join("-", local.suffix_parts)
  suffix_safe            = lower(join("", local.suffix_parts))
  pipeline_identifier    = join("_", concat(local.prefix_parts, local.suffix_parts))
  work_item_field_name   = join(" ", concat(local.prefix_parts, local.suffix_parts))

  unique_environment_tags = distinct(var.environment_tags)
  unique_work_items       = distinct(var.work_items)

  environment_mapping = {
    acc  = "accessibility-testing"
    aud  = "audit-testing"
    com  = "compliance-testing"
    dev  = "development"
    eph  = "ephemeral"
    fet  = "feature"
    hot  = "hotfix"
    int  = "integration-testing"
    pen  = "penetration-testing"
    per  = "performance-testing"
    prd  = "production"
    prod = "production"
    reg  = "regression-testing"
    stg  = "staging"
    sys  = "system-testing"
    tst  = "testing"
    uat  = "user-acceptance-testing"

  }

  translated_environment_tags = distinct([for tag in local.unique_environment_tags : lookup(local.environment_mapping, tag, tag)])

  ## Names based on the recommendations of
  ## https://learn.microsoft.com/en-us/azure/devops/organizations/settings/naming-restrictions?view=azure-devops

  azdo = {

    agent_pool = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "agtpol"
      min_length  = 1
      max_length  = 64
      scope       = "Organization"
      regex       = "^[^<,>,%,&,,:,\\,?,/,*,|,\",#,$,+,.,']*$"
    }

    branch_policy_build_validation = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "bpbv"
      min_length  = 1
      max_length  = 256
      scope       = "Repository"
      regex       = "^[^/:\\~&%;@'\"?<>|#$*}{,+=\\[\\]]*$"
    }

    build_definition = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 260)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 260) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 260 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 260) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 260 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 260 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "blddef"
      min_length  = 1
      max_length  = 260
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|]*$"
    }


    build_folder = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 260)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 260) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 260 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 260) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 260 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 260 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "arpth"
      min_length  = 1
      max_length  = 260
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|]*$"
    }

    elastic_pool = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "eapool"
      min_length  = 1
      max_length  = 64
      scope       = "Organization"
      regex       = "^[^<,>,%,&,,:,\\,?,/,*,|,\",#,,$,+,.,']*$"
    }

    environment = { for item in local.translated_environment_tags : item => {
      name        = substr(join("-", compact([local.prefix, "", item, "apply", local.suffix])), 0, 240)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", item, "apply", local.suffix])), 0, 240) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", item, "apply", local.suffix])), 0, max(0, 240 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", item, "apply", local.suffix])), 0, 240) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", item, "apply", local.suffix])), 0, max(0, 240 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", item, "apply", local.suffix])), 0, max(0, 240 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "envapp"
      min_length  = 1
      max_length  = 240
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|]*$"
    } }



    environment_apply = { for item in local.translated_environment_tags : item => {
      name        = substr(join("-", compact([local.prefix, "", item, "apply", local.suffix])), 0, 240)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", item, "apply", local.suffix])), 0, 240) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", item, "apply", local.suffix])), 0, max(0, 240 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", item, "apply", local.suffix])), 0, 240) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", item, "apply", local.suffix])), 0, max(0, 240 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", item, "apply", local.suffix])), 0, max(0, 240 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "envapp"
      min_length  = 1
      max_length  = 240
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|]*$"
    } }

    environment_apply_basic = { for item in local.translated_environment_tags : item => {
      name        = substr(join("-", compact([item, "apply"])), 0, 240)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([item, "apply", local.suffix])), 0, 240) : (join("-", compact([trimsuffix(substr(join("-", compact([item, "apply", local.suffix])), 0, max(0, 240 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([item, "apply"])), 0, 240) ? join("-", compact([trimsuffix(substr(join("-", compact([item, "apply", local.suffix])), 0, max(0, 240 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([item, "apply", local.suffix])), 0, max(0, 240 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "envappb"
      min_length  = 1
      max_length  = 240
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|]*$"
    } }

    environment_basic = { for item in local.translated_environment_tags : item => {
      name        = substr(item, 0, 240)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([item, local.suffix])), 0, 240) : (join("-", compact([trimsuffix(substr(join("-", compact([item, local.suffix])), 0, max(0, 240 - length(local.random) - 1)), "-"), local.random])) != substr(item, 0, 240) ? join("-", compact([trimsuffix(substr(join("-", compact([item, local.suffix])), 0, max(0, 240 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([item, local.suffix])), 0, max(0, 240 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "envbas"
      min_length  = 1
      max_length  = 240
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|]*$"
    } }

    environment_plan = { for item in local.translated_environment_tags : item => {
      name        = substr(join("-", compact([local.prefix, "", item, "plan", local.suffix])), 0, 240)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", item, "plan", local.suffix])), 0, 240) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", item, "plan", local.suffix])), 0, max(0, 240 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", item, "plan", local.suffix])), 0, 240) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", item, "plan", local.suffix])), 0, max(0, 240 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", item, "plan", local.suffix])), 0, max(0, 240 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "envpln"
      min_length  = 1
      max_length  = 240
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|]*$"
    } }

    environment_plan_basic = { for item in local.translated_environment_tags : item => {
      name        = substr(join("-", compact([item, "plan"])), 0, 240)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([item, "plan", local.suffix])), 0, 240) : (join("-", compact([trimsuffix(substr(join("-", compact([item, "plan", local.suffix])), 0, max(0, 240 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([item, "plan"])), 0, 240) ? join("-", compact([trimsuffix(substr(join("-", compact([item, "plan", local.suffix])), 0, max(0, 240 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([item, "plan", local.suffix])), 0, max(0, 240 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "envplnb"
      min_length  = 1
      max_length  = 240
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|]*$"
    } }

    environment_work_item = { for tag in local.translated_environment_tags : tag => {
      for item in local.unique_work_items : item => {
        name        = substr(join("-", compact([local.prefix, "", tag, item, local.suffix])), 0, 240)
        name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", tag, item, local.suffix])), 0, 240) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", tag, item, local.suffix])), 0, max(0, 240 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", tag, item, local.suffix])), 0, 240) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", tag, item, local.suffix])), 0, max(0, 240 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", tag, item, local.suffix])), 0, max(0, 240 - length(local.random) - 2)), "-"), local.random])))
        dashes      = true
        slug        = "envwi"
        min_length  = 1
        max_length  = 240
        scope       = "Project"
        regex       = "^[^/\\:*?\"<>|]*$"
      }
    } }

    environment_work_item_basic = { for tag in local.translated_environment_tags : tag => {
      for item in local.unique_work_items : item => {
        name        = substr(join("-", compact([tag, item])), 0, 240)
        name_unique = length(local.random) == 0 ? substr(join("-", compact([tag, item, local.suffix])), 0, 240) : (join("-", compact([trimsuffix(substr(join("-", compact([tag, item, local.suffix])), 0, max(0, 240 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([tag, item])), 0, 240) ? join("-", compact([trimsuffix(substr(join("-", compact([tag, item, local.suffix])), 0, max(0, 240 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([tag, item, local.suffix])), 0, max(0, 240 - length(local.random) - 2)), "-"), local.random])))
        dashes      = true
        slug        = "envwib"
        min_length  = 1
        max_length  = 240
        scope       = "Project"
        regex       = "^[^/\\:*?\"<>|]*$"
      }
    } }

    git_repository = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "gitrepo"
      min_length  = 1
      max_length  = 64
      scope       = "Project"
      regex       = "^[^/\\\\:*?\"<>;#$*{},+=\\[\\]|\\x00-\\x1F\\x7F]+$"
    }

    git_repository_branch = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "gitbranch"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    }

    git_repository_bug_branch_dash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["bug-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("", ["bug-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("", ["bug-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("", ["bug-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("", ["bug-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("", ["bug-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slashes     = false
      slug        = "gitbugbr"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^/\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    } }

    git_repository_bug_branch_slash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["bug/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("", ["bug/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("", ["bug/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("", ["bug/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("", ["bug/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("", ["bug/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slashes     = true
      slug        = "gitbugbr"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    } }


    git_repository_dev_branch_dash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["dev-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("", ["dev-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("", ["dev-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("", ["dev-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("", ["dev-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("", ["dev-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slashes     = false
      slug        = "gitdevbr"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^/\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    } }

    git_repository_dev_branch_slash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["dev/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("", ["dev/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("", ["dev/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("", ["dev/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("", ["dev/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("", ["dev/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slashes     = true
      slug        = "gitdevbr"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    } }

    git_repository_development_branch_dash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["development-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("", ["development-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("", ["development-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("", ["development-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("", ["development-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("", ["development-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slashes     = false
      slug        = "gitdevbr"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^/\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    } }

    git_repository_development_branch_slash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["development/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("", ["development/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("", ["development/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("", ["development/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("", ["development/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("", ["development/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slashes     = true
      slug        = "gitdevbr"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    } }

    git_repository_feature_branch_dash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["feature-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("", ["feature-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("", ["feature-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("", ["feature-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("", ["feature-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("", ["feature-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slashes     = false
      slug        = "gitfetbr"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^/\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    } }

    git_repository_feature_branch_slash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["feature/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("", ["feature/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("", ["feature/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("", ["feature/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("", ["feature/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("", ["feature/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slashes     = true
      slug        = "gitfetbr"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    } }


    git_repository_fix_branch_dash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["fix-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("", ["fix-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("", ["fix-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("", ["fix-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("", ["fix-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("", ["fix-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slashes     = false
      slug        = "gitfixbr"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^/\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    } }

    git_repository_fix_branch_slash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["fix/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("", ["fix/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("", ["fix/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("", ["fix/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("", ["fix/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("", ["fix/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slashes     = true
      slug        = "gitfixbr"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    } }


    git_repository_hotfix_branch_dash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["hotfix-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("", ["hotfix-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("", ["hotfix-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("", ["hotfix-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("", ["hotfix-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("", ["hotfix-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slashes     = false
      slug        = "githotbr"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^/\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    } }

    git_repository_hotfix_branch_slash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["hotfix/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("", ["hotfix/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("", ["hotfix/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("", ["hotfix/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("", ["hotfix/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("", ["hotfix/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slashes     = true
      slug        = "githotbr"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    } }

    git_repository_release_branch_dash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["release-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("", ["release-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("", ["release-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("", ["release-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("", ["release-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("", ["release-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slashes     = false
      slug        = "gitrelbr"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^/\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    } }

    git_repository_release_branch_slash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["release/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("", ["release/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("", ["release/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("", ["release/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("", ["release/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("", ["release/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slashes     = true
      slug        = "gitrelbr"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    } }

    git_repository_support_branch_dash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["support-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("", ["support-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("", ["support-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("", ["support-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("", ["support-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("", ["support-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slashes     = false
      slug        = "gitsupbr"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^/\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    } }

    git_repository_support_branch_slash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["support/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250))
      name_unique = length(local.random) == 0 ? lower(substr(join("", ["support/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) : (lower(join("-", compact([trimsuffix(substr(join("", ["support/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("", ["support/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 250)) ? lower(join("-", compact([trimsuffix(substr(join("", ["support/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("", ["support/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, max(0, 250 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slashes     = true
      slug        = "gitsupbr"
      min_length  = 1
      max_length  = 250
      scope       = "Repository"
      regex       = "^[^\\x00-\\x20\\x7F~^:?*\\[\\\\]+$"
    } }

    group = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "grp"
      min_length  = 1
      max_length  = 256
      scope       = "Project or Organization"
      regex       = "^[^,/\\\\[\\]:<>+=;?*|\\x00-\\x1F\\x7F]+$"
    }


    project = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "prj"
      min_length  = 1
      max_length  = 64
      scope       = "Organization"
      regex       = "^[^/\\\\:*?\"'<>;#$*{},+=\\[\\]|\\x00-\\x1F\\x7F]+$"
    }


    serviceendpoint_argocd = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "seargocd"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_artifactory = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "seart"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_aws = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "seaws"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_azurecr = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "seazcr"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_azuredevops = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "seazdo"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_azurerm = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "seazrm"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }
    serviceendpoint_bitbucket = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sebitb"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_dockerregistry = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sedr"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_externaltfs = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "setfs"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_gcp_terraform = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "segcptf"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_generic = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "seg"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_generic_git = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "seggit"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_github = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "segh"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_github_enterprise = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "segh"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_incomingwebhook = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "seiw"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_jenkins = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sej"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }
    serviceendpoint_jfrog_artifactory_v2 = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sejfa"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_jfrog_distribution_v2 = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sejfd"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_jfrog_platform_v2 = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sejfp"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_jfrog_xray_v2 = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sejx"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_kubernetes = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sek"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_maven = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "semvn"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_nexus = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sen"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_npm = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "senpm"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_nuget = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "senug"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_octopusdeploy = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "seod"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }


    serviceendpoint_runpipeline = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "serp"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_servicefabric = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sesf"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_sonarcloud = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sesc"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_sonarqube = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sesq"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_ssh = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sessh"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_azure_service_bus = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "seasb"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_black_duck = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sebd"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_checkmarx_one = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "secm1"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_checkmarx_sast = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "secmst"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_checkmarx_sca = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "secmsca"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_dynamics_lifecycle_services = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sedls"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_generic_v2 = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "seg2"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_gitlab = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "segl"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_openshift = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "seos"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_snyk = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sesnyk"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_visualstudiomarketplace = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 1024 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "sevsm"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }


    team = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "adt"
      min_length  = 1
      max_length  = 64
      scope       = "Project"
      regex       = "^[^/\\\\:*?\"<>;#$*{},+=\\[\\]|\\x00-\\x1F\\x7F]+$"
    }

    variable_group = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "advg"
      min_length  = 1
      max_length  = 256
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    agent_queue = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "aq"
      min_length  = 1
      max_length  = 64
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    dashboard = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "dash"
      min_length  = 1
      max_length  = 256
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    pipeline_stage = {
      name        = substr(local.pipeline_identifier, 0, 256)
      name_unique = length(local.random) == 0 ? substr(local.pipeline_identifier, 0, 256) : (join("_", compact([trimsuffix(substr(local.pipeline_identifier, 0, max(0, 256 - length(local.random) - 1)), "_"), local.random])) != substr(local.pipeline_identifier, 0, 256) ? join("_", compact([trimsuffix(substr(local.pipeline_identifier, 0, max(0, 256 - length(local.random) - 1)), "_"), local.random])) : join("_", compact([trimsuffix(substr(local.pipeline_identifier, 0, max(0, 256 - length(local.random) - 2)), "_"), local.random])))
      dashes      = false
      slug        = "ps"
      min_length  = 1
      max_length  = 256
      scope       = "Project"
      regex       = "^[A-Za-z_][A-Za-z0-9_]*$"
    }

    deployment_group = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "dg"
      min_length  = 1
      max_length  = 256
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    pipeline_job = {
      name        = substr(local.pipeline_identifier, 0, 256)
      name_unique = length(local.random) == 0 ? substr(local.pipeline_identifier, 0, 256) : (join("_", compact([trimsuffix(substr(local.pipeline_identifier, 0, max(0, 256 - length(local.random) - 1)), "_"), local.random])) != substr(local.pipeline_identifier, 0, 256) ? join("_", compact([trimsuffix(substr(local.pipeline_identifier, 0, max(0, 256 - length(local.random) - 1)), "_"), local.random])) : join("_", compact([trimsuffix(substr(local.pipeline_identifier, 0, max(0, 256 - length(local.random) - 2)), "_"), local.random])))
      dashes      = false
      slug        = "pj"
      min_length  = 1
      max_length  = 256
      scope       = "Project"
      regex       = "^[A-Za-z_][A-Za-z0-9_]*$"
    }

    environment_kubernetes_resource = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "ekr"
      min_length  = 1
      max_length  = 256
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    pipeline_variable = {
      name        = substr(local.pipeline_identifier, 0, 256)
      name_unique = length(local.random) == 0 ? substr(local.pipeline_identifier, 0, 256) : (join("_", compact([trimsuffix(substr(local.pipeline_identifier, 0, max(0, 256 - length(local.random) - 1)), "_"), local.random])) != substr(local.pipeline_identifier, 0, 256) ? join("_", compact([trimsuffix(substr(local.pipeline_identifier, 0, max(0, 256 - length(local.random) - 1)), "_"), local.random])) : join("_", compact([trimsuffix(substr(local.pipeline_identifier, 0, max(0, 256 - length(local.random) - 2)), "_"), local.random])))
      dashes      = false
      slug        = "pv"
      min_length  = 1
      max_length  = 256
      scope       = "Project"
      regex       = "^[A-Za-z0-9._]+$"
    }

    feed = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 64 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "feed"
      min_length  = 1
      max_length  = 64
      scope       = "Project or Organization"
      regex       = "^[^\\s@~;{}'+=,<>|/\\\\?:&$*\"#\\[\\]%]+$"
    }

    variable_group_variable = {
      name        = substr(local.pipeline_identifier, 0, 256)
      name_unique = length(local.random) == 0 ? substr(local.pipeline_identifier, 0, 256) : (join("_", compact([trimsuffix(substr(local.pipeline_identifier, 0, max(0, 256 - length(local.random) - 1)), "_"), local.random])) != substr(local.pipeline_identifier, 0, 256) ? join("_", compact([trimsuffix(substr(local.pipeline_identifier, 0, max(0, 256 - length(local.random) - 1)), "_"), local.random])) : join("_", compact([trimsuffix(substr(local.pipeline_identifier, 0, max(0, 256 - length(local.random) - 2)), "_"), local.random])))
      dashes      = false
      slug        = "vgv"
      min_length  = 1
      max_length  = 256
      scope       = "Project"
      regex       = "^[A-Za-z0-9._]+$"
    }

    pipeline_matrix = {
      name        = substr(local.pipeline_identifier, 0, 100)
      name_unique = length(local.random) == 0 ? substr(local.pipeline_identifier, 0, 100) : (join("_", compact([trimsuffix(substr(local.pipeline_identifier, 0, max(0, 100 - length(local.random) - 1)), "_"), local.random])) != substr(local.pipeline_identifier, 0, 100) ? join("_", compact([trimsuffix(substr(local.pipeline_identifier, 0, max(0, 100 - length(local.random) - 1)), "_"), local.random])) : join("_", compact([trimsuffix(substr(local.pipeline_identifier, 0, max(0, 100 - length(local.random) - 2)), "_"), local.random])))
      dashes      = false
      slug        = "pm"
      min_length  = 1
      max_length  = 100
      scope       = "Project"
      regex       = "^[A-Za-z][A-Za-z0-9_]{0,99}$"
    }

    wiki = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 235)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 235) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 235 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 235) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 235 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 235 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "wiki"
      min_length  = 1
      max_length  = 235
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    wiki_page = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 235)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 235) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 235 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 235) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 235 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 235 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "wp"
      min_length  = 1
      max_length  = 235
      scope       = "Project"
      regex       = "^[^\\\\#\\x00-\\x1F\\x7F]+$"
    }

    workitem = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 255 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 255 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 255 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "wi"
      min_length  = 1
      max_length  = 255
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    workitemquery = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 255 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 255 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 255 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "wiq"
      min_length  = 1
      max_length  = 255
      scope       = "Project"
      regex       = "^[^/\\\\<>*?\"+|:\\x00-\\x1F\\x7F]+$"
    }

    workitemquery_folder = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 255 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 255 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 255 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "wiqf"
      min_length  = 1
      max_length  = 255
      scope       = "Project"
      regex       = "^[^\\\\<>*?\"+|:\\x00-\\x1F\\x7F]+$"
    }

    workitemtracking_field = {
      name        = substr(local.work_item_field_name, 0, 128)
      name_unique = length(local.random) == 0 ? substr(local.work_item_field_name, 0, 128) : (join(" ", compact([trimspace(substr(local.work_item_field_name, 0, max(0, 128 - length(local.random) - 1))), local.random])) != substr(local.work_item_field_name, 0, 128) ? join(" ", compact([trimspace(substr(local.work_item_field_name, 0, max(0, 128 - length(local.random) - 1))), local.random])) : join(" ", compact([trimspace(substr(local.work_item_field_name, 0, max(0, 128 - length(local.random) - 2))), local.random])))
      dashes      = false
      slug        = "wtfld"
      min_length  = 1
      max_length  = 128
      scope       = "Organization"
      regex       = "^[^.,;'`:~\\\\/*|?\"&%$!+=()\\[\\]{}<>-]+$"
    }

    workitemtrackingprocess_process = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "wtpp"
      min_length  = 1
      max_length  = 256
      scope       = "Organization"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    artifact_package = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256))
      name_unique = length(local.random) == 0 ? lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)) : (lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random]))) != lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)) ? lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random]))) : lower(join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random]))))
      dashes      = true
      slug        = "pkg"
      min_length  = 1
      max_length  = 256
      scope       = "Project"
      regex       = "^[a-z0-9_.-]+$"
    }

    organization = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 49)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 49) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 49 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 49) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 49 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 49 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "org"
      min_length  = 1
      max_length  = 49
      scope       = "Global"
      regex       = "^[A-Za-z0-9]([A-Za-z0-9-]{0,47}[A-Za-z0-9])?$"
    }

    process = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "proc"
      min_length  = 1
      max_length  = 256
      scope       = "Organization"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    workitemtrackingprocess_field = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "wtpfld"
      min_length  = 1
      max_length  = 256
      scope       = "Organization"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    security_group = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "sg"
      min_length  = 1
      max_length  = 256
      scope       = "Project or Organization"
      regex       = "^[^,/\\\\[\\]:<>+=;?*|\\x00-\\x1F\\x7F]+$"
    }

    workitemtrackingprocess_group = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "wtpg"
      min_length  = 1
      max_length  = 256
      scope       = "Organization"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    workitemtrackingprocess_page = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "wtppg"
      min_length  = 1
      max_length  = 256
      scope       = "Organization"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    workitemtrackingprocess_state = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "wtps"
      min_length  = 1
      max_length  = 256
      scope       = "Organization"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    workitemtrackingprocess_workitemtype = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "wtpwit"
      min_length  = 1
      max_length  = 256
      scope       = "Organization"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    area_path = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 255 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 255 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 255 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "ap"
      min_length  = 1
      max_length  = 255
      scope       = "Project"
      regex       = "^[^\\\\/:*?\"<>|#$&+\\x00-\\x1F\\x7F]+$"
    }

    iteration_path = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 255 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 255 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 255 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "ip"
      min_length  = 1
      max_length  = 255
      scope       = "Project"
      regex       = "^[^\\\\/:*?\"<>|#$&+\\x00-\\x1F\\x7F]+$"
    }

    board_column = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "bc"
      min_length  = 1
      max_length  = 256
      scope       = "Project"
      regex       = "^[^\\x00-\\x1F\\x7F]+$"
    }

    board_swimlane = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = length(local.random) == 0 ? substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) : (join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) != substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256) ? join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 1)), "-"), local.random])) : join("-", compact([trimsuffix(substr(join("-", compact([local.prefix, "", local.suffix])), 0, max(0, 256 - length(local.random) - 2)), "-"), local.random])))
      dashes      = true
      slug        = "bs"
      min_length  = 1
      max_length  = 256
      scope       = "Project"
      regex       = "^[^\\x00-\\x1F\\x7F]+$"
    }
  }

}
