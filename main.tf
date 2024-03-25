##############################################################
#######               Main Resources                   #######
##############################################################

resource "random_string" "main" {
  length  = 60
  special = false
  upper   = false
  numeric = var.unique-include-numbers
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
  random                 = substr(coalesce(var.unique-seed, local.random_safe_generation), 0, var.unique-length)
  prefix                 = join("-", var.prefix)
  prefix_safe            = lower(join("", var.prefix))
  suffix                 = join("-", var.suffix)
  suffix_unique          = join("-", concat(var.suffix, [local.random]))
  suffix_safe            = lower(join("", var.suffix))
  suffix_unique_safe     = lower(join("", concat(var.suffix, [local.random])))
  
  ## Names based on the recomendations of
  ## https://learn.microsoft.com/en-us/azure/devops/organizations/settings/naming-restrictions?view=azure-devops

  azdo = {

    organization = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "org"
      min_length  = 1
      max_length  = 50
      scope       = "AzureDevOps"
      regex       = "^[^\\/\"\\[\\]:|<>+=;,?*@&_][^\\/\"\\[\\]:|<>+=;,?*@&]+[^\\/\"\\[\\]:|<>+=;,?*@&.-]$"
    }

    project = {
      name        = substr(join("-", compact([local.prefix, "", local.suffix])), 0, 64)
      name_unique = substr(join("-", compact([local.prefix, "", local.suffix_unique])), 0, 64)
      dashes      = true
      slug        = "prj"
      min_length  = 1
      max_length  = 64
      scope       = "Organization"
      regex       = "^[^\\/\"\\[\\]:|<>+=;,?*@&_][^\\/\"\\[\\]:|<>+=;,?*@&]+[^\\/\"\\[\\]:|<>+=;,?*@&.-]$"
    }
  }
  validation = {

    organization = {
      valid_name        = length(regexall(local.azdo.organization.regex, local.azdo.organization.name)) > 0 && length(local.azdo.organization.name) > local.azdo.organization.min_length
      valid_name_unique = length(regexall(local.azdo.organization.regex, local.azdo.organization.name_unique)) > 0
    }
    project = {
      valid_name        = length(regexall(local.azdo.project.regex, local.azdo.project.name)) > 0 && length(local.azdo.project.name) > local.azdo.project.min_length
      valid_name_unique = length(regexall(local.azdo.project.regex, local.azdo.project.name_unique)) > 0
    }
  }
}
