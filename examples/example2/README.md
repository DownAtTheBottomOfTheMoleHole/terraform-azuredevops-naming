<!-- markdownlint-disable -->
<!-- markdown-table-prettify-ignore-start -->
<!-- prettier-ignore-start -->
<!-- start_of_terraform_docs -->
# Terraform

This reference is generated with [terraform-docs](https://terraform-docs.io/) through pre-commit.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.14.0, < 2.0.0 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | >= 1.16.0, < 2.0.0 |

```hcl
module "azdo_naming" {
  source  = "DownAtTheBottomOfTheMoleHole/naming/azuredevops"
  version = ">= 11.0.0, < 12.0.0"

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
  work_items             = ["1234"]
}

resource "azuredevops_project" "example_2" {
  name               = module.azdo_naming.project.name
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}

resource "azuredevops_git_repository" "example_2" {
  project_id = azuredevops_project.example_2.id
  name       = module.azdo_naming.git_repository.name
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_git_repository_branch" "feature_branch" {
  repository_id = azuredevops_git_repository.example_2.id
  name          = module.azdo_naming.git_repository_feature_branch_slash["1234"].name_unique
  ref_branch    = azuredevops_git_repository.example_2.default_branch
}
```

## Resources

| Name | Type |
|------|------|
| [azuredevops_git_repository.example_2](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/git_repository) | resource |
| [azuredevops_git_repository_branch.feature_branch](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/git_repository_branch) | resource |
| [azuredevops_project.example_2](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/project) | resource |

## Inputs

No inputs.

## Outputs

No outputs.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azdo_naming"></a> [azdo\_naming](#module\_azdo\_naming) | DownAtTheBottomOfTheMoleHole/naming/azuredevops | >= 11.0.0, < 12.0.0 |

## Documentation maintenance

The Terraform reference is generated from module source. After changing inputs, outputs, examples, or metadata, run `pre-commit run --all-files` and commit the regenerated documentation.
<!-- end_of_terraform_docs -->
<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- markdown-table-prettify-ignore-end -->
