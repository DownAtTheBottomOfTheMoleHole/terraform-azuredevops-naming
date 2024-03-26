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

<!-- consuming terraform-azuredevops-naming -->
## Consuming terraform-azuredevops-naming

  To consume this module add the following to your module.tf:
```hcl
  module "terraform-azuredevops-naming" {
    	 source  = "DownAtTheBottomOfTheMoleHole/naming/azuredevops"
    	 version  = "1.0.0"
    
	 # Optional variables
    	 prefix  = []
    	 suffix  = []
    	 unique-include-numbers  = true
    	 unique-length  = 4
    	 unique-seed  = ""
  }
  ```

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

| Name | Description |
|------|-------------|
| <a name="output_area_path"></a> [area\_path](#output\_area\_path) | Azure DevOps Area Path |
| <a name="output_artifact"></a> [artifact](#output\_artifact) | Azure DevOps Artifact |
| <a name="output_board_column"></a> [board\_column](#output\_board\_column) | Azure DevOps Board Column |
| <a name="output_board_swimlane"></a> [board\_swimlane](#output\_board\_swimlane) | Azure DevOps Board Swimlane |
| <a name="output_field_name"></a> [field\_name](#output\_field\_name) | Azure DevOps Field Name |
| <a name="output_git_repo"></a> [git\_repo](#output\_git\_repo) | Azure DevOps Git Repository |
| <a name="output_iteration_path"></a> [iteration\_path](#output\_iteration\_path) | Azure DevOps Iteration Path |
| <a name="output_organization"></a> [organization](#output\_organization) | Azure DevOps Organization |
| <a name="output_pipeline_expression"></a> [pipeline\_expression](#output\_pipeline\_expression) | Azure DevOps Pipeline Expression |
| <a name="output_pipeline_job"></a> [pipeline\_job](#output\_pipeline\_job) | Azure DevOps Pipeline job Name |
| <a name="output_pipeline_stage"></a> [pipeline\_stage](#output\_pipeline\_stage) | Azure DevOps Pipeline atage Name |
| <a name="output_process"></a> [process](#output\_process) | Azure DevOps Process |
| <a name="output_project"></a> [project](#output\_project) | Azure DevOps Project |
| <a name="output_security_group"></a> [security\_group](#output\_security\_group) | Azure Security Group |
| <a name="output_team"></a> [team](#output\_team) | Azure DevOps Team |
| <a name="output_tfvc_file"></a> [tfvc\_file](#output\_tfvc\_file) | Azure DevOps TFVC File |
| <a name="output_tfvc_label"></a> [tfvc\_label](#output\_tfvc\_label) | Azure DevOps TFVC Label |
| <a name="output_tfvc_repo"></a> [tfvc\_repo](#output\_tfvc\_repo) | Azure DevOps TFVC repo |
| <a name="output_tfvc_shelveset"></a> [tfvc\_shelveset](#output\_tfvc\_shelveset) | Azure DevOps TFVC Shelveset |
| <a name="output_tfvc_workspace"></a> [tfvc\_workspace](#output\_tfvc\_workspace) | Azure DevOps TFVC Workspace |
| <a name="output_unique-seed"></a> [unique-seed](#output\_unique-seed) | Custom value for the random characters to be used |
| <a name="output_validation"></a> [validation](#output\_validation) | Validation rules applied |
| <a name="output_work_item_tag"></a> [work\_item\_tag](#output\_work\_item\_tag) | Azure DevOps Work Item Tag |

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

##### Random version

```shell
tfupdate provider random . --version "$(tfupdate release latest hashicorp/random --source-type tfregistryProvider)" --recursive
```

---

<!-- Readme Navigation -->

[(Back to the Top)](#Terraform)

---
<!-- end_of_terraform_docs -->
<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- markdown-table-prettify-ignore-end -- >
