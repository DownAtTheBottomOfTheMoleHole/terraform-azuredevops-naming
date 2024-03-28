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

  ## Names based on the recommendations of
  ## https://learn.microsoft.com/en-us/azure/devops/organizations/settings/naming-restrictions?view=azure-devops

  azdo = {

    area_path = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 255)
      dashes      = true
      slug        = "arpth"
      min_length  = 1
      max_length  = 255
      scope       = "Organization"
      regex       = "^[^\\/\\:*?\"<>|#$*+\\x00-\\x1F]*$"
    }

    artifact = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 256)
      dashes      = true
      slug        = "art"
      min_length  = 1
      max_length  = 256
      scope       = "Organization"
      regex       = "^[a-z0-9_.-]+$"
    }

    board_column = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 256)
      dashes      = true
      slug        = "brdcol"
      min_length  = 1
      max_length  = 256
      scope       = "Organization"
      regex       = "^[^\\x00-\\x1F]{1,256}$"
    }

    board_swimlane = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 256)
      dashes      = true
      slug        = "brdswm"
      min_length  = 1
      max_length  = 256
      scope       = "Organization"
      regex       = "^[^\\x00-\\x1F]{1,256}$"
    }

    field_name = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 128)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 128)
      dashes      = true
      slug        = "fld"
      min_length  = 1
      max_length  = 128
      scope       = "Organization"
      regex       = "^[^ .,;':~\\/\\*|?\"&%$!+=()\\[\\]{}<>-]*$"
    }

    git_repo = {
      name        = lower(substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64))
      name_unique = lower(substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 64))
      dashes      = true
      slug        = "gitrepo"
      min_length  = 1
      max_length  = 64
      scope       = "Organization"
      regex       = "^[^\\/\\:*?\"<>|;#$*{}+,=\\[\\]\\x00-\\x1F]*$"
    }

    iteration_path = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 255)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 255)
      dashes      = true
      slug        = "itpth"
      min_length  = 1
      max_length  = 255
      scope       = "Organization"
      regex       = "^[^\\/\\:*?\"<>|#$*+\\x00-\\x1F]*$"
    }

    organization = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "org"
      min_length  = 1
      max_length  = 50
      scope       = "AzureDevOps"
      regex       = "^[a-z0-9]([-a-z0-9]*[a-z0-9])?$"
    }

    pipeline_expression = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 256)
      dashes      = true
      slug        = "pexp"
      min_length  = 1
      max_length  = 256
      scope       = "Organization"
      regex       = "^[^\\/\\:*?\"<>|;#$*{}+,=\\[\\]\\x00-\\x1F]*$"
    }

    pipeline_job = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 256)
      dashes      = true
      slug        = "pljob"
      min_length  = 1
      max_length  = 256
      scope       = "Organization"
      regex       = "^[^\\/\\:*?\"<>|;#$*{}+,=\\[\\]\\x00-\\x1F]*$"
    }

    pipeline_stage = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 256)
      dashes      = true
      slug        = "plstg"
      min_length  = 1
      max_length  = 256
      scope       = "Organization"
      regex       = "^[^\\/\\:*?\"<>|;#$*{}+,=\\[\\]\\x00-\\x1F]*$"
    }

    process = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 256)
      dashes      = true
      slug        = "proc"
      min_length  = 1
      max_length  = 256
      scope       = "AzureDevOps"
      regex       = "^[^\\x00-\\x1F]{1,256}$"
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

    security_group = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 256)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 256)
      dashes      = true
      slug        = "secgrp"
      min_length  = 1
      max_length  = 256
      scope       = "Organization"
      regex       = "^[^\\/\\[\\]:|<>+=;?*,\\x01-\\x1F]*$"
    }

    team = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "team"
      min_length  = 1
      max_length  = 64
      scope       = "Organization"
      regex       = "^[^_\\.\\.\\.\\/\\:*?\"<>|;#$*{}+,=\\[\\]\\x00-\\x1F]*$"
    }

    tfvc_file = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 260)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 260)
      dashes      = true
      slug        = "tfvcfile"
      min_length  = 1
      max_length  = 260
      scope       = "Organization"
      regex       = "^[^\\/\\:*?\"<>|;#$*{}+,=\\[\\]\\x00-\\x1F]*$"
    }

    tfvc_label = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "tfvclbl"
      min_length  = 1
      max_length  = 64
      scope       = "Organization"
      regex       = "^[^\\/\\:*?\"<>|;#$*{}+,=\\[\\]\\x00-\\x1F]*$"
    }

    tfvc_repo = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "tfvcrepo"
      min_length  = 1
      max_length  = 64
      scope       = "Organization"
      regex       = "^[^\\/\\:*?\"<>|;#$*{}+,=\\[\\]\\x00-\\x1F]*$"
    }

    tfvc_shelveset = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "tfvcss"
      min_length  = 1
      max_length  = 64
      scope       = "Organization"
      regex       = "^[^\\/\\:*?\"<>|;#$*{}+,=\\[\\]\\x00-\\x1F]*$"
    }

    tfvc_workspace = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "tfvcws"
      min_length  = 1
      max_length  = 64
      scope       = "Organization"
      regex       = "^[^\\/\\:*?\"<>|;#$*{}+,=\\[\\]\\x00-\\x1F]*$"
    }
    work_item_tag = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "witg"
      min_length  = 1
      max_length  = 64
      scope       = "Organization"
      regex       = "^[^\\/\\:*?\"<>|;#$*{}+,=\\[\\]\\x00-\\x1F]*$"
    }

  }
}