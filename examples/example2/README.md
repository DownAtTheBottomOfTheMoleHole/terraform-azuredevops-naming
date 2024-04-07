<!-- markdownlint-disable -->
<!-- markdown-table-prettify-ignore-start -->
<!-- prettier-ignore-start -->
<!-- start_of_terraform_docs -->
# Terraform

The below documentation was generated via Terraform docs using pre-commit

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

## Requirements

No requirements.

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

```hcl
module "azdo_naming" {
  source  = "DownAtTheBottomOfTheMoleHole/naming/azuredevops"
  version = "2.1.5"

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

```


---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

## Resources

| Name | Type |
|------|------|
| [azuredevops_git_repository.example](https://registry.terraform.io/providers/hashicorp/azuredevops/latest/docs/resources/git_repository) | resource |
| [azuredevops_git_repository_branch.feature_branch](https://registry.terraform.io/providers/hashicorp/azuredevops/latest/docs/resources/git_repository_branch) | resource |
| [azuredevops_project.example](https://registry.terraform.io/providers/hashicorp/azuredevops/latest/docs/resources/project) | resource |

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

## Inputs

No inputs.

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

## Outputs

No outputs.

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azdo_naming"></a> [azdo\_naming](#module\_azdo\_naming) | DownAtTheBottomOfTheMoleHole/naming/azuredevops | 2.1.5 |

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

##### Terraform versions

Terraform version and terraform provider versions have been set using tfupdate.
In order to update the installed providers to the latest versions please first install tfupdate using the below instructions and then run the following commands from the root of the repo in a powershell session.
Please only run the commands for the providers/modules you are using.

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

[(Back to the Table of Contents)](#table-of-contents)

---
<!-- end_of_terraform_docs -->