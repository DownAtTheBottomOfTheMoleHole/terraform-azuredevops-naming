  module "azdo_naming" {
         source  = "DownAtTheBottomOfTheMoleHole/naming/azuredevops"
         version  = "2.1.5"

     # Optional variables
         environment_tags  = [
  "dev",
  "uat",
  "prd"
]
         prefix  = []
         suffix  = []
         unique_include_numbers  = true
         unique_length  = 4
         unique_seed  = ""
         work_items  = []
  }

resource "azuredevops_project" "example" {
  name               = "Example Project"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}

resource "azuredevops_git_repository" "example" {
  project_id = azuredevops_project.example.id
  name       = "Example Git Repository"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository_branch" "example" {
  repository_id = azuredevops_git_repository.example.id
  name          = "example-branch-name"
  ref_branch    = azuredevops_git_repository.example.default_branch
}

