module "azdo_naming" {
  source  = "DownAtTheBottomOfTheMoleHole/naming/azuredevops"
  version = ">= 6.0.0, <7.0.0"

  # Optional variables
  environment_tags = [
    "dev",
    "uat",
    "prd"
  ]
  prefix                 = ["dbmh"]
  suffix                 = ["test"]
  unique_include_numbers = true
  unique_length          = 4
  unique_seed            = ""
  work_items             = []
}

resource "azuredevops_project" "example_1" {
  name               = module.azdo_naming.project.name
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
  description        = "Managed by Terraform"
  features = {
    "testplans" = "disabled"
    "artifacts" = "disabled"
  }
}
