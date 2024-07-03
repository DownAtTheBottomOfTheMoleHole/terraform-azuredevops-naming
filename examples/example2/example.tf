module "azdo_naming" {
  source  = "DownAtTheBottomOfTheMoleHole/naming/azuredevops"
  version = "~> 2.2.0"

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

resource "azuredevops_project" "example" {
  name               = module.azdo_naming.project.name
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}

resource "azuredevops_git_repository" "example" {
  project_id = azuredevops_project.example.id
  name       = module.azdo_naming.git_repository.name
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository_branch" "feature_branch" {
  repository_id = azuredevops_git_repository.example.id
  name          = module.azdo_naming.git_repository_feature_branch_slash.name_unique
  ref_branch    = azuredevops_git_repository.example.default_branch
}

