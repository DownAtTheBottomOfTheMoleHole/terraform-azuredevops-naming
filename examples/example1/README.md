<!-- markdownlint-disable -->
<!-- markdown-table-prettify-ignore-start -->
<!-- prettier-ignore-start -->
<!-- start_of_terraform_docs -->
# Terraform

The below documentation was generated via Terraform docs using pre-commit

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
```

## Resources

| Name | Type |
|------|------|
| [azuredevops_project.example_1](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/project) | resource |

## Inputs

No inputs.

## Outputs

No outputs.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azdo_naming"></a> [azdo\_naming](#module\_azdo\_naming) | DownAtTheBottomOfTheMoleHole/naming/azuredevops | >= 11.0.0, < 12.0.0 |

## Documentation maintenance

The Terraform reference is generated from the module source with [terraform-docs](https://github.com/terraform-docs/terraform-docs). After changing inputs, outputs, or metadata, run the terraform-docs pre-commit hooks and commit the resulting documentation.
<!-- end_of_terraform_docs -->
<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- markdown-table-prettify-ignore-end -->
