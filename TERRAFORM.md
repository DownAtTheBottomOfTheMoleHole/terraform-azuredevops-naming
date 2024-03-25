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
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.0 |

---

<!-- Readme Navigation -->

[(Back to the Top)](#Terraform)

---

<!-- consuming Module_Name -->
## Consuming Module_Name

  To consume this module add the following to your module.tf:
```hcl
  module "Module_Name" {
    	 source  = "github.com/DownAtTheBottomOfTheMoleHole/Module_Name.git"
    
	 # Optional variables
    	 prefix  = []
    	 suffix  = []
    	 unique-include-numbers  = true
    	 unique-length  = 4
    	 unique-seed  = ""
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
| [random_string.first_letter](https://registry.terraform.io/providers/hashicorp/random/3.6.0/docs/resources/string) | resource |
| [random_string.main](https://registry.terraform.io/providers/hashicorp/random/3.6.0/docs/resources/string) | resource |

---

<!-- Readme Navigation -->

[(Back to the Top)](#Terraform)

---

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_prefix"></a> [prefix](#input\_prefix) | It is not recommended that you use prefix by azure you should be using a suffix for your resources. | `list(string)` | `[]` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | It is recommended that you specify a suffix for consistency. please use only lowercase characters when possible | `list(string)` | `[]` | no |
| <a name="input_unique-include-numbers"></a> [unique-include-numbers](#input\_unique-include-numbers) | If you want to include numbers in the unique generation | `bool` | `true` | no |
| <a name="input_unique-length"></a> [unique-length](#input\_unique-length) | Max length of the uniqueness suffix to be added | `number` | `4` | no |
| <a name="input_unique-seed"></a> [unique-seed](#input\_unique-seed) | Custom value for the random characters to be used | `string` | `""` | no |

---

<!-- Readme Navigation -->

[(Back to the Top)](#Terraform)

---

## Outputs

| Name | Description | Value | Sensitive |
|------|-------------|-------|:---------:|
| <a name="output_organization"></a> [organization](#output\_organization) | Azure DevOps Organization | `"example-organization-value"` | no |
| <a name="output_project"></a> [project](#output\_project) | Azure DevOps Project | `"example-project-value"` | no |
| <a name="output_unique-seed"></a> [unique-seed](#output\_unique-seed) | n/a | `"example-unique-seed-value"` | no |
| <a name="output_validation"></a> [validation](#output\_validation) | n/a | `"example-validation-value"` | no |

---

<!-- Readme Navigation -->

[(Back to the Top)](#Terraform)

---

## Modules

No modules.

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
tfupdate terraform . --version "$(tfupdate release latest hashicorp/terraform)" --recursive
```

please also add the terraform version to the `terraform_installer_version` variable in `build/pipelines/iac_templates/variables.yml`

##### Azure Naming module version

```shell
tfupdate module Azure/naming/azurerm . --version "$(tfupdate release latest Azure/naming/azurerm --source-type tfregistryModule)" --recursive
```

##### AWS version

```shell
tfupdate provider aws . --version "$(tfupdate release latest hashicorp/aws --source-type tfregistryProvider)" --recursive
```

##### AzureAD version

```shell
tfupdate provider azuread . --version "$(tfupdate release latest hashicorp/azuread --source-type tfregistryProvider)" --recursive
```

##### AzureDevOps version

```shell
tfupdate provider azuredevops . --version "$(tfupdate release latest microsoft/azuredevops --source-type tfregistryProvider)" --recursive
```

##### AzureRm version

```shell
tfupdate provider azurerm . --version "$(tfupdate release latest hashicorp/azurerm --source-type tfregistryProvider)" --recursive
```

##### Random version

```shell
tfupdate provider random . --version "$(tfupdate release latest hashicorp/random --source-type tfregistryProvider)" --recursive
```

##### Time version

```shell
tfupdate provider time . --version "$(tfupdate release latest hashicorp/time --source-type tfregistryProvider)" --recursive
```

---

<!-- Readme Navigation -->

[(Back to the Top)](#Terraform)

---
<!-- end_of_terraform_docs -->
<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- markdown-table-prettify-ignore-end -- >
