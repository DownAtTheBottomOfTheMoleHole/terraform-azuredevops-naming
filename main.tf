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
  prefix                 = join("-", var.prefix)
  prefix_safe            = lower(join("", var.prefix))
  suffix                 = join("-", var.suffix)
  suffix_unique          = join("-", concat(var.suffix, [local.random]))
  suffix_safe            = lower(join("", var.suffix))
  suffix_unique_safe     = lower(join("", concat(var.suffix, [local.random])))

  unique_environment_tags = distinct(var.environment_tags)
  unique_work_items       = distinct(var.work_items)

  environment_mapping = {
    dev = "development"
    stg = "staging"
    prd = "production"
    tst = "testing"
    uat = "user-acceptance-testing"
    per = "performance-testing"
    int = "integration-testing"
    sys = "system-testing"
    reg = "regression-testing"
    acc = "accessibility-testing"
    com = "compliance-testing"
    aud = "audit-testing"
    pen = "penetration-testing"
    fet = "feature"
    hot = "hotfix"

  }

  translated_environment_tags = [for tag in local.unique_environment_tags : lookup(local.environment_mapping, tag, tag)]

  ## Names based on the recommendations of
  ## https://learn.microsoft.com/en-us/azure/devops/organizations/settings/naming-restrictions?view=azure-devops

  azdo = {

    agent_pool = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "agtpol"
      min_length  = 1
      max_length  = 64
      scope       = "Organization"
      regex       = "^[^<,>,%,&,,:,\\,?,/,*,|,\",#,$,+,.,']*$"
    }

    branch_policy_build_validation = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 256)
      dashes      = true
      slug        = "bpbv"
      min_length  = 1
      max_length  = 256
      scope       = "repository"
      regex       = "^[^/:\\~&%;@'\"?<>|#$*}{,+=\\[\\]]*$"
    }

    build_definition = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "blddef"
      min_length  = 1
      max_length  = 260
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|]*$"
    }


    build_folder = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "arpth"
      min_length  = 1
      max_length  = 260
      scope       = "Organization"
      regex       = "^[^/\\:*?\"<>|]*$"
    }

    elastic_pool = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "eapool"
      min_length  = 1
      max_length  = 64
      scope       = "Organization"
      regex       = "^[^<,>,%,&,,:,\\,?,/,*,|,\",#,,$,+,.,']*$"
    }

    environment = { for item in local.translated_environment_tags : item => {
      name        = substr(join("-", compact([local.prefix, "", item, "apply", local.suffix])), 0, 240)
      name_unique = substr(join("-", compact([local.prefix, "", item, "apply", local.suffix_unique])), 0, 240)
      dashes      = true
      slug        = "envapp"
      min_length  = 1
      max_length  = 240
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|]*$"
    } }



    environment_apply = { for item in local.translated_environment_tags : item => {
      name        = substr(join("-", compact([local.prefix, "", item, "apply", local.suffix])), 0, 240)
      name_unique = substr(join("-", compact([local.prefix, "", item, "apply", local.suffix_unique])), 0, 240)
      dashes      = true
      slug        = "envapp"
      min_length  = 1
      max_length  = 240
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|]*$"
    } }

    environment_apply_basic = { for item in local.translated_environment_tags : item => {
      name        = substr(join("-", compact([item, "apply"])), 0, 240)
      name_unique = substr(join("-", compact([item, "apply", local.suffix_unique])), 0, 240)
      dashes      = true
      slug        = "envappb"
      min_length  = 1
      max_length  = 240
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|]*$"
    } }

    environment_basic = { for item in local.translated_environment_tags : item => {
      name        = substr(item, 0, 240)
      name_unique = substr(join("-", compact([item, local.suffix_unique])), 0, 240)
      dashes      = true
      slug        = "envbas"
      min_length  = 1
      max_length  = 240
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|]*$"
    } }

    environment_plan = { for item in local.translated_environment_tags : item => {
      name        = substr(join("-", compact([local.prefix, "", item, "plan", local.suffix])), 0, 240)
      name_unique = substr(join("-", compact([local.prefix, "", item, "plan", local.suffix_unique])), 0, 240)
      dashes      = true
      slug        = "envpln"
      min_length  = 1
      max_length  = 240
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|]*$"
    } }

    environment_plan_basic = { for item in local.translated_environment_tags : item => {
      name        = substr(join("-", compact([item, "plan"])), 0, 240)
      name_unique = substr(join("-", compact([item, "plan", local.suffix_unique])), 0, 240)
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
        name_unique = substr(join("-", compact([local.prefix, "", tag, item, local.suffix_unique])), 0, 240)
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
        name_unique = substr(join("-", compact([tag, item, local.suffix_unique])), 0, 240)
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
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 64))
      dashes      = true
      slug        = "gitrepo"
      min_length  = 1
      max_length  = 64
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    git_repository_branch = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 255))
      dashes      = true
      slug        = "gitbranch"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    }

    git_repository_bug_branch_dash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["bug-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 255))
      name_unique = lower(substr(join("", ["bug-", join("-", compact([item, local.prefix, "", local.suffix_unique]))]), 0, 255))
      dashes      = true
      slashes     = false
      slug        = "gitbugbr"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    } }

    git_repository_bug_branch_slash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["bug/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 255))
      name_unique = lower(substr(join("", ["bug/", join("-", compact([item, local.prefix, "", local.suffix_unique]))]), 0, 255))
      dashes      = true
      slashes     = true
      slug        = "gitbugbr"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    } }


    git_repository_dev_branch_dash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["dev-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 255))
      name_unique = lower(substr(join("", ["dev-", join("-", compact([item, local.prefix, "", local.suffix_unique]))]), 0, 255))
      dashes      = true
      slashes     = false
      slug        = "gitdevbr"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    } }

    git_repository_dev_branch_slash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["dev/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 255))
      name_unique = lower(substr(join("", ["dev/", join("-", compact([item, local.prefix, "", local.suffix_unique]))]), 0, 255))
      dashes      = true
      slashes     = true
      slug        = "gitdevbr"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    } }

    git_repository_development_branch_dash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["development-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 255))
      name_unique = lower(substr(join("", ["development-", join("-", compact([item, local.prefix, "", local.suffix_unique]))]), 0, 255))
      dashes      = true
      slashes     = false
      slug        = "gitdevbr"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    } }

    git_repository_development_branch_slash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["development/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 255))
      name_unique = lower(substr(join("", ["development/", join("-", compact([item, local.prefix, "", local.suffix_unique]))]), 0, 255))
      dashes      = true
      slashes     = true
      slug        = "gitdevbr"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    } }

    git_repository_feature_branch_dash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["feature-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 255))
      name_unique = lower(substr(join("", ["feature-", join("-", compact([item, local.prefix, "", local.suffix_unique]))]), 0, 255))
      dashes      = true
      slashes     = false
      slug        = "gitfetbr"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    } }

    git_repository_feature_branch_slash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["feature/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 255))
      name_unique = lower(substr(join("", ["feature/", join("-", compact([item, local.prefix, "", local.suffix_unique]))]), 0, 255))
      dashes      = true
      slashes     = true
      slug        = "gitfetbr"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    } }


    git_repository_fix_branch_dash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["fix-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 255))
      name_unique = lower(substr(join("", ["fix-", join("-", compact([item, local.prefix, "", local.suffix_unique]))]), 0, 255))
      dashes      = true
      slashes     = false
      slug        = "gitfixbr"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    } }

    git_repository_fix_branch_slash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["fix/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 255))
      name_unique = lower(substr(join("", ["fix/", join("-", compact([item, local.prefix, "", local.suffix_unique]))]), 0, 255))
      dashes      = true
      slashes     = true
      slug        = "gitfixbr"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    } }


    git_repository_hotfix_branch_dash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["hotfix-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 255))
      name_unique = lower(substr(join("", ["hotfix-", join("-", compact([item, local.prefix, "", local.suffix_unique]))]), 0, 255))
      dashes      = true
      slashes     = false
      slug        = "githotbr"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    } }

    git_repository_hotfix_branch_slash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["hotfix/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 255))
      name_unique = lower(substr(join("", ["hotfix/", join("-", compact([item, local.prefix, "", local.suffix_unique]))]), 0, 255))
      dashes      = true
      slashes     = true
      slug        = "githotbr"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    } }

    git_repository_release_branch_dash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["release-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 255))
      name_unique = lower(substr(join("", ["release-", join("-", compact([item, local.prefix, "", local.suffix_unique]))]), 0, 255))
      dashes      = true
      slashes     = false
      slug        = "gitrelbr"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    } }

    git_repository_release_branch_slash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["release/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 255))
      name_unique = lower(substr(join("", ["release/", join("-", compact([item, local.prefix, "", local.suffix_unique]))]), 0, 255))
      dashes      = true
      slashes     = true
      slug        = "gitrelbr"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    } }

    git_repository_support_branch_dash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["support-", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 255))
      name_unique = lower(substr(join("", ["support-", join("-", compact([item, local.prefix, "", local.suffix_unique]))]), 0, 255))
      dashes      = true
      slashes     = false
      slug        = "gitsupbr"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    } }

    git_repository_support_branch_slash = { for item in local.unique_work_items : item => {
      name        = lower(substr(join("", ["support/", join("-", compact([item, local.prefix, "", local.suffix]))]), 0, 255))
      name_unique = lower(substr(join("", ["support/", join("-", compact([item, local.prefix, "", local.suffix_unique]))]), 0, 255))
      dashes      = true
      slashes     = true
      slug        = "gitsupbr"
      min_length  = 1
      max_length  = 255
      scope       = "Repository"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=\\x00-\\x1F\\x7F]+$"
    } }

    group = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "grp"
      min_length  = 1
      max_length  = 1024
      scope       = "Organization"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }


    project = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "prj"
      min_length  = 1
      max_length  = 64
      scope       = "Organization"
      regex       = "^[^_\\.\\/\\:*?\"<>|;#$*{}+,=\\[\\]\\x00-\\x1F]*$"
    }


    serviceendpoint_argocd = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "seargocd"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_artifactory = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "seart"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_aws = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "seaws"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_azurecr = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "seazcr"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_azuredevops = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "seazdo"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_azurerm = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "seazrm"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }
    serviceendpoint_bitbucket = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "sebitb"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_dockerregistry = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "sedr"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_externaltfs = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "setfs"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_gcp_terraform = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "segcptf"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_generic = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "seg"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_generic_git = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "seggit"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_github = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "segh"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_github_enterprise = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "segh"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_incomingwebhook = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "seiw"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_jenkins = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "sej"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }
    serviceendpoint_jfrog_artifactory_v2 = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "sejfa"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_jfrog_distribution_v2 = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "sejfd"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_jfrog_platform_v2 = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "sejfp"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_jfrog_xray_v2 = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "sejx"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_kubernetes = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "sek"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_maven = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "semvn"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_nexus = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "sen"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_npm = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "senpm"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_nuget = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "senug"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_octopusdeploy = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "seod"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }


    serviceendpoint_runpipeline = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "serp"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_servicefabric = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "sesf"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_sonarcloud = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "sesc"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_sonarqube = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "sesq"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    serviceendpoint_ssh = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 1024))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 1024))
      dashes      = true
      slug        = "sessh"
      min_length  = 1
      max_length  = 1024
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }


    team = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 255))
      dashes      = true
      slug        = "adt"
      min_length  = 1
      max_length  = 255
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }

    variable_group = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 256))
      dashes      = true
      slug        = "advg"
      min_length  = 1
      max_length  = 256
      scope       = "Project"
      regex       = "^[^/\\:*?\"<>|~';.,\\[\\]{}()@#$%^&!+=]*$"
    }
  }

}
