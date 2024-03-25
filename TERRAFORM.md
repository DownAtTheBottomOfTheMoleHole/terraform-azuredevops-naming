<!-- markdownlint-disable -->
<!-- markdown-table-prettify-ignore-start -->
<!-- prettier-ignore-start -->
<!-- start_of_terraform_docs -->
# Terraform

The below documentation was generated via Terraform docs using pre-commit

---

<!-- Readme Navigation -->

[(Back to the Top)](#Terraform)

---

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.7.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.42.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.47.0 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | 1.0.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.97.1 |
| <a name="requirement_mongodbatlas"></a> [mongodbatlas](#requirement\_mongodbatlas) | 1.15.2 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | 0.11.1 |

---

<!-- Readme Navigation -->

[(Back to the Top)](#Terraform)

---

<!-- consuming Module_Name -->
## Consuming Module_Name

To consume this module add the following to your module.tf:
```hcl
module "Module_Name" {
	 source  = "github.com/RolfMoleman/Module_Name.git"

	 # Required variables
	 application_name  = 
	 application_shortname  = 
	 azdo_pat  = 
	 azdo_project_name  = 
	 azdo_repo_name  = 
	 cag_division  = 
	 environment_tag  = 
	 resource_group_name  = 

	 # Optional variables
	 aws_access_key  = ""
	 aws_profile  = ""
	 aws_resource_location  = "eu-west-1"
	 aws_secret_key  = ""
	 azdo_orgurl  = null
	 azrm_client_id  = null
	 azrm_client_secret  = null
	 azrm_keyvault_whitelist  = []
	 azrm_resource_location  = "northeurope"
	 azrm_storage_whitelist  = []
	 azrm_subscription_id  = null
	 azrm_tenant_id  = null
	 default_tags  = {}
	 time_secret_expiry  = 100
	 time_spn_expiry  = 100
}
```

## Example 1

```hcl
##### Put your example Terraform code in this file and it will be displayed in the read me. ######


---

<!-- Readme Navigation -->

[(Back to the Top)](#Terraform)

---

## Resources

| Name | Type |
|------|------|
| [random_password.aws_pass](https://registry.terraform.io/providers/hashicorp/random/3.6.0/docs/resources/password) | resource |
| [random_password.azure_pass](https://registry.terraform.io/providers/hashicorp/random/3.6.0/docs/resources/password) | resource |
| [time_offset.secret_expiry](https://registry.terraform.io/providers/hashicorp/time/0.10.0/docs/resources/offset) | resource |
| [time_offset.spn_password_expiry](https://registry.terraform.io/providers/hashicorp/time/0.10.0/docs/resources/offset) | resource |
| [azuread_client_config.bootstrap](https://registry.terraform.io/providers/hashicorp/azuread/2.47.0/docs/data-sources/client_config) | data source |
| [azuread_group.bootstrap](https://registry.terraform.io/providers/hashicorp/azuread/2.47.0/docs/data-sources/group) | data source |
| [azuredevops_project.bcaapp](https://registry.terraform.io/providers/microsoft/azuredevops/0.11.0/docs/data-sources/project) | data source |
| [azuredevops_project.bootstrap](https://registry.terraform.io/providers/microsoft/azuredevops/0.11.0/docs/data-sources/project) | data source |
| [azurerm_client_config.bootstrap](https://registry.terraform.io/providers/hashicorp/azurerm/3.94.0/docs/data-sources/client_config) | data source |
| [azurerm_subscription.bcaapp](https://registry.terraform.io/providers/hashicorp/azurerm/3.94.0/docs/data-sources/subscription) | data source |
| [azurerm_subscription.bootstrap](https://registry.terraform.io/providers/hashicorp/azurerm/3.94.0/docs/data-sources/subscription) | data source |

---

<!-- Readme Navigation -->

[(Back to the Top)](#Terraform)

---

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | Project/application name | `string` | n/a | yes |
| <a name="input_application_shortname"></a> [application\_shortname](#input\_application\_shortname) | short version of project/application name | `string` | n/a | yes |
| <a name="input_azdo_pat"></a> [azdo\_pat](#input\_azdo\_pat) | Azure Devops Personal Access token (can be set to system.accesstoken) | `string` | n/a | yes |
| <a name="input_azdo_project_name"></a> [azdo\_project\_name](#input\_azdo\_project\_name) | azure devops project name | `string` | n/a | yes |
| <a name="input_azdo_repo_name"></a> [azdo\_repo\_name](#input\_azdo\_repo\_name) | The name of the Azure Devops Git Repository your code resides in | `string` | n/a | yes |
| <a name="input_cag_division"></a> [cag\_division](#input\_cag\_division) | Division of CAG 3 character abbreviation e.hg. BCA, MMG | `string` | n/a | yes |
| <a name="input_environment_tag"></a> [environment\_tag](#input\_environment\_tag) | Environment tag e.g. dev, test, systest, UAT, Prod | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the name of the existing resource group to be used for the service plan | `string` | n/a | yes |
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | AWS access key | `string` | `""` | no |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | AWS profile | `string` | `""` | no |
| <a name="input_aws_resource_location"></a> [aws\_resource\_location](#input\_aws\_resource\_location) | Resource location. Must be a valid AWS region | `string` | `"eu-west-1"` | no |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | AWS secret key | `string` | `""` | no |
| <a name="input_azdo_orgurl"></a> [azdo\_orgurl](#input\_azdo\_orgurl) | short version of project/application name | `string` | `null` | no |
| <a name="input_azrm_client_id"></a> [azrm\_client\_id](#input\_azrm\_client\_id) | Service principal id - cannot be null if working with azure | `string` | `null` | no |
| <a name="input_azrm_client_secret"></a> [azrm\_client\_secret](#input\_azrm\_client\_secret) | Service principal password - cannot be null if working with azure | `string` | `null` | no |
| <a name="input_azrm_keyvault_whitelist"></a> [azrm\_keyvault\_whitelist](#input\_azrm\_keyvault\_whitelist) | List of IP addresses and CIDR blocks for Key Vault whitelist to be combined with the defaults in main.tf | `list(string)` | `[]` | no |
| <a name="input_azrm_resource_location"></a> [azrm\_resource\_location](#input\_azrm\_resource\_location) | Resource group location. Must be a valid azure region | `string` | `"northeurope"` | no |
| <a name="input_azrm_storage_whitelist"></a> [azrm\_storage\_whitelist](#input\_azrm\_storage\_whitelist) | List of IP addresses and CIDR blocks for storage account whitelist to be combined with the defaults in main.tf | `list(string)` | `[]` | no |
| <a name="input_azrm_subscription_id"></a> [azrm\_subscription\_id](#input\_azrm\_subscription\_id) | Azure subscription id - cannot be null if working with azure | `string` | `null` | no |
| <a name="input_azrm_tenant_id"></a> [azrm\_tenant\_id](#input\_azrm\_tenant\_id) | Azure tenant id. cannot be null if working with Azure | `string` | `null` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default map of tags to be applied to all resources generated by this module. | `map(string)` | `{}` | no |
| <a name="input_time_secret_expiry"></a> [time\_secret\_expiry](#input\_time\_secret\_expiry) | Number of years from now when keyvault secrets should expire | `number` | `100` | no |
| <a name="input_time_spn_expiry"></a> [time\_spn\_expiry](#input\_time\_spn\_expiry) | Number of years from now when service principal password should expire | `number` | `100` | no |

---

<!-- Readme Navigation -->

[(Back to the Top)](#Terraform)

---

## Outputs

| Name | Description | Value | Sensitive |
|------|-------------|-------|:---------:|
| <a name="output_application_name"></a> [application\_name](#output\_application\_name) | The project/application name for this repository | `"application_name"` | no |
| <a name="output_application_shortname"></a> [application\_shortname](#output\_application\_shortname) | The shortened project/application name for this repository | `"application_shortname"` | no |
| <a name="output_aws_access_key"></a> [aws\_access\_key](#output\_aws\_access\_key) | The AWS Access Key | `<sensitive>` | yes |
| <a name="output_aws_profile"></a> [aws\_profile](#output\_aws\_profile) | The AWS profile used | `"aws_profile"` | no |
| <a name="output_aws_resource_location"></a> [aws\_resource\_location](#output\_aws\_resource\_location) | The AWS region used for the resources | `"eu-west-1"` | no |
| <a name="output_azdo_orgurl"></a> [azdo\_orgurl](#output\_azdo\_orgurl) | The Azure DevOps URL used for this run | `"https://dev.azure.com/bcagroup"` | no |
| <a name="output_azdo_pat"></a> [azdo\_pat](#output\_azdo\_pat) | The Azure DevOps Personal Access Token (PAT) used for this run | `<sensitive>` | yes |
| <a name="output_azrm_client_id"></a> [azrm\_client\_id](#output\_azrm\_client\_id) | The ID of the service principal used for this run | `"azrm_client_id"` | no |
| <a name="output_azrm_resource_location"></a> [azrm\_resource\_location](#output\_azrm\_resource\_location) | The location of resources being worked on with this run | `"northeurope"` | no |
| <a name="output_azure_subscription_display_name"></a> [azure\_subscription\_display\_name](#output\_azure\_subscription\_display\_name) | The current subscription name | `"subscription_display_name"` | no |
| <a name="output_azure_subscription_id"></a> [azure\_subscription\_id](#output\_azure\_subscription\_id) | The current subscription id | `"subscription_id"` | no |
| <a name="output_azuredevops_project_name"></a> [azuredevops\_project\_name](#output\_azuredevops\_project\_name) | The current Azure DevOps name | `"project_name"` | no |
| <a name="output_environment"></a> [environment](#output\_environment) | The environment being worked on with this run | `"dev"` | no |
| <a name="output_tags"></a> [tags](#output\_tags) | The tags applied to resources as part of this run | <pre>{<br>  "ADO-Project": "project_name",<br>  "Application": "application_name",<br>  "Environment": "dev",<br>  "Managed-By": "Terraform",<br>  "Owner": "project_name Contributors",<br>  "Repository": "repo_name"<br>}</pre> | no |
| <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id) | The azure tenant id of resources being worked on with this run | `"tenant_id"` | no |

---

<!-- Readme Navigation -->

[(Back to the Top)](#Terraform)

---

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azrm_naming"></a> [azrm\_naming](#module\_azrm\_naming) | Azure/naming/azurerm | 0.4.1 |

---

<!-- Readme Navigation -->

[(Back to the Top)](#Terraform)

---

#### Automatically generated Terraform variables

This project uses terraform-docs to automatically generate tfvar files per environment that will allow you to have per environment values as well as common values.

the common values will reside in:

for the terraform directory (the terraform directory the pipelines  refer to): `.\environment\default.tfvars`

Environment specific variables then reside in an environment specific folder under the terraform directory e.g. `.\environment\dev\variables.tfvars`

to generate these files do the following

   1. Navigate to your terraform directory using command prompt or powershell
   2. To generate environment specific variables run `terraform-docs tfvars hcl . --output-file .\environment\poc\variables.tfvars --output-mode inject --read-comments --description --header-from ./terraform-docs/tf_header.txt --footer-from ./terraform-docs/tf_footer.txt` replacing the environment foldername as appropriate
   3. To generate the common variables file run `terraform-docs tfvars hcl . --output-file .\environment\default.tfvars --output-mode inject --read-comments --description --header-from ./terraform-docs/tf_header.txt --footer-from ./terraform-docs/tf_footer.txt`

##### Terraform versions

Terraform version and terraform provider versions have been set using tfupdate.
In order to update the installed providers to the latest versions please first install tfupdate using the below instructions and then run the following commands from the root of the repo in a powershell session. Please only run the commands for the providers/modules you are using.

##### Installing Tfupdate

the tfupdate repo can be found [here](https://github.com/minamijoyo/tfupdate)

either download the tarball and add tfupdate.exe to your PATH or do the following:

1. Ensure you have [Go](https://go.dev/doc/install) installed
2. Clone the repository locally `git clone https://github.com/minamijoyo/tfupdate.git`
3. build the source code with `go build`
4. Add the complied binaries to your PATH

##### Terraform version

```shell
tfupdate terraform . --version ">=$(tfupdate release latest hashicorp/terraform)" --recursive
```

please also add the terraform version to the `terraform_installer_version` variable in `build/pipelines/iac_templates/variables.yml`

##### Azure Naming module version

```shell
tfupdate module Azure/naming/azurerm . --version ">=$(tfupdate release latest Azure/naming/azurerm --source-type tfregistryModule)" --recursive
```

##### AWS version

```shell
tfupdate provider aws . --version ">=$(tfupdate release latest hashicorp/aws --source-type tfregistryProvider)" --recursive
```

##### AzureAD version

```shell
tfupdate provider azuread . --version ">=$(tfupdate release latest hashicorp/azuread --source-type tfregistryProvider)" --recursive
```

##### AzureDevOps version

```shell
tfupdate provider azuredevops . --version ">=$(tfupdate release latest microsoft/azuredevops --source-type tfregistryProvider)" --recursive
```

##### AzureRm version

```shell
tfupdate provider azurerm . --version ">=$(tfupdate release latest hashicorp/azurerm --source-type tfregistryProvider)" --recursive
```

##### Random version

```shell
tfupdate provider random . --version ">=$(tfupdate release latest hashicorp/random --source-type tfregistryProvider)" --recursive
```

##### Time version

```shell
tfupdate provider time . --version ">=$(tfupdate release latest hashicorp/time --source-type tfregistryProvider)" --recursive
```

---

<!-- Readme Navigation -->

[(Back to the Top)](#Terraform)

---
<!-- end_of_terraform_docs -->
<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- markdown-table-prettify-ignore-end -- >
