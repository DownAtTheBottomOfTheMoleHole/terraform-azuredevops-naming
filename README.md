# Azure DevOps Naming Module

[![terraform-azuredevops-naming][logo-image]](https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming)

<!-- Github Badges -->
<!--
*** replace with badges relevant to your repo
-->

[![rm Standard Terraform Module Pull Request](https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming/actions/workflows/pullrequest.yml/badge.svg)](https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming/actions/workflows/pullrequest.yml)

[![Create New Release](https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming/actions/workflows/release.yml/badge.svg)](https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming/actions/workflows/release.yml)

[![Nightly Maintenance Scan of Full Codebase](https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming/actions/workflows/scheduled_maintenance.yml/badge.svg)](https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming/actions/workflows/nightly_mega-linter.yml)

<!-- Made With Badges -->
<!--
*** replace with badges relevant to your repo
-->

<!-- Made Badge for latest version of terraform_module_template not currently working -->
<!--
[![GitHub release (latest SemVer)](https://img.shields.io/azure-devops/tag/DownAtTheBottomOfTheMoleHole/terraform_module_template?label=terraform_module_template)](https://github.com/DownAtTheBottomOfTheMoleHole/terraform_module_template/tags)
-->

[![made%20with-Markdown](https://img.shields.io/badge/Made%20with-Markdown-1f425f.svg)](http://commonmark.org)
[![made%20with-MegaLinter](https://img.shields.io/badge/Made%20with-MegaLinter-1f425f.svg)](https://megalinter.io/latest/)
[![made%20with-PowerShell](https://img.shields.io/badge/Made%20with-PowerShell-1f425f.svg)](https://github.com/PowerShell/PowerShell)
[![made%20with-pre-commit](https://img.shields.io/badge/Made%20with-pre--commit-1f425f.svg)](https://github.com/pre-commit/pre-commit)
[![made%20with-terraform](https://img.shields.io/badge/Made%20with-Terraform-1f425f.svg)](https://www.gnu.org/software/bash/)

<!-- Precommit Badges -->
<!--
*** replace with badges relevant to your repo
-->

these are the pre-commit hooks used for this repo:

[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/pre-commit/pre-commit-hooks?label=check-added-large-files)](https://github.com/pre-commit/pre-commit-hooks/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/pre-commit/pre-commit-hooks?label=check-case-conflict)](https://github.com/pre-commit/pre-commit-hooks/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/pre-commit/pre-commit-hooks?label=check-merge-conflict)](https://github.com/pre-commit/pre-commit-hooks/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/pre-commit/pre-commit-hooks?label=check-json)](https://github.com/pre-commit/pre-commit-hooks/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/pre-commit/pre-commit-hooks?label=check-yaml)](https://github.com/pre-commit/pre-commit-hooks/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/pre-commit/pre-commit-hooks?label=detect-private-key)](https://github.com/pre-commit/pre-commit-hooks/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/pre-commit/pre-commit-hooks?label=end-of-file-fixer)](https://github.com/pre-commit/pre-commit-hooks/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/pre-commit/pre-commit-hooks?label=trailing-whitespace)](https://github.com/pre-commit/pre-commit-hooks/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/streetsidesoftware/cspell?label=CSpell)](https://github.com/streetsidesoftware/cspell/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/tag/pre-commit/mirrors-prettier?label=Prettier)](https://github.com/pre-commit/mirrors-prettier/tags)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/antonbabenko/pre-commit-terraform?label=terraform_fmt)](https://github.com/antonbabenko/pre-commit-terraform/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/antonbabenko/pre-commit-terraform?label=terraform_tflint)](https://github.com/antonbabenko/pre-commit-terraform/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/antonbabenko/pre-commit-terraform?label=terraform_validate)](https://github.com/antonbabenko/pre-commit-terraform/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/antonbabenko/pre-commit-terraform?label=terrascan)](https://github.com/antonbabenko/pre-commit-terraform/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/antonbabenko/pre-commit-terraform?label=tfupdate)](https://github.com/antonbabenko/pre-commit-terraform/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/antonbabenko/pre-commit-terraform?label=infracost_breakdown)](https://github.com/antonbabenko/pre-commit-terraform/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/terraform-docs/terraform-docs?label=terraform-docs-go)](https://github.com/terraform-docs/terraform-docs/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/oxsecurity/megalinter?label=megalinter-incremental)](https://github.com/oxsecurity/megalinter/releases)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/mattlqx/pre-commit-sign?label=pre-commit-sign)](https://github.com/mattlqx/pre-commit-sign/releases)

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [Azure DevOps Naming Module](#azure-devops-naming-module)
  - [Table of Contents](#table-of-contents)
  - [About The Project](#about-the-project)
  - [Built With](#built-with)
- [Terraform](#terraform)
  - [Requirements](#requirements)
  - [Consuming terraform-azuredevops-naming](#consuming-terraform-azuredevops-naming)
  - [Resources](#resources)
  - [Inputs](#inputs)
  - [Outputs](#outputs)
  - [Modules](#modules)
    - [Automatically generated Terraform variables](#automatically-generated-terraform-variables)
      - [Terraform versions](#terraform-versions)
      - [Installing Tfupdate](#installing-tfupdate)
      - [Terraform version](#terraform-version)
      - [Random version](#random-version)
  - [Roadmap](#roadmap)
  - [Contributing](#contributing)
    - [Contributing Prerequisites](#contributing-prerequisites)
  - [License](#license)
  - [This module is licensed under the MIT license which can be found here: LICENSE.md](#this-module-is-licensed-under-the-mit-license-which-can-be-found-here-licensemd)
  - [Contact](#contact)

<!-- ABOUT THE PROJECT -->

## About The Project

A terraform module to enable consistent naming of Azure DevOps resources

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

## Built With

- [cspell](https://github.com/streetsidesoftware/cspell-cli)
- [GitVersion](https://github.com/GitTools/GitVersion)
- [Markdown](https://www.markdownguide.org/)
- [Megalinter](https://github.com/oxsecurity/megalinter)
- [Pre-Commit](https://pre-commit.com/)
- [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)
- [prettier](https://github.com/prettier/prettier)
- [Terraform](https://www.terraform.io/)
- [Terraform-docs](https://github.com/terraform-docs/terraform-docs)
- [tflint](https://github.com/terraform-linters/tflint)
- [tfupdate](https://github.com/minamijoyo/tfupdate)

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

<!-- Terraform -->
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

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6.0 |

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

<!-- consuming terraform-azuredevops-naming -->
### Consuming terraform-azuredevops-naming

  To consume this module add the following to your module.tf:
```hcl
  module "azdo_naming" {
    	 source  = "DownAtTheBottomOfTheMoleHole/naming/azuredevops"
    	 version  = "2.1.7"
    
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
  ```

## Creating a project

```hcl
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

---

<!-- Readme Navigation -->

[(Back to the Top)](#Terraform)

---

## Creating a unique branch name

this shows creating: 
 - a project
 - git repository inside the project
 - a feature branch based on the default branch with a unique name

```hcl
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

resource "azuredevops_project" "example_2" {
  name               = module.azdo_naming.project.name
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}

resource "azuredevops_git_repository" "example_2" {
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

### Resources

| Name | Type |
|------|------|
| [random_string.first_letter](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [random_string.main](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment_tags"></a> [environment\_tags](#input\_environment\_tags) | List of environment names in their shortened form. These will be translated to full names in the module. | `list(string)` | <pre>[<br>  "dev",<br>  "uat",<br>  "prd"<br>]</pre> | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix to be used for naming resources. If used we suggest using a company abreviation e.g dbmh. | `list(string)` | `[]` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | Suffix to be used for naming resources. It is recommended to use lowercase characters for consistency. | `list(string)` | `[]` | no |
| <a name="input_unique_include_numbers"></a> [unique\_include\_numbers](#input\_unique\_include\_numbers) | Determines whether numbers should be included in the unique suffix generation. | `bool` | `true` | no |
| <a name="input_unique_length"></a> [unique\_length](#input\_unique\_length) | Maximum length of the unique suffix to be added to resource names. | `number` | `4` | no |
| <a name="input_unique_seed"></a> [unique\_seed](#input\_unique\_seed) | Custom seed value for generating unique random characters. | `string` | `""` | no |
| <a name="input_work_items"></a> [work\_items](#input\_work\_items) | List of Work Items or issue numbers to be used in branch name and environment name creation. For example, ['1234', '1235'] will create branch names like 'feature/1234-' and 'feature/1235-'. | `list(string)` | `[]` | no |

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

### Outputs

| Name | Description | Value | Sensitive |
|------|-------------|-------|:---------:|
| <a name="output_agent_pool"></a> [agent\_pool](#output\_agent\_pool) | The agent pool used in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 64,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^\u003c,\u003e,%,\u0026,,:,\\,?,/,*,|,\",#,$,+,.,']*$",<br>  "scope": "Organization",<br>  "slug": "agtpol"<br>}</pre> | no |
| <a name="output_branch_policy_build_validation"></a> [branch\_policy\_build\_validation](#output\_branch\_policy\_build\_validation) | The display name of the branch policy for build validation in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 256,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/:\\~\u0026%;@'\"?\u003c\u003e|#$*}{,+=\\[\\]]*$",<br>  "scope": "repository",<br>  "slug": "bpbv"<br>}</pre> | no |
| <a name="output_build_definition"></a> [build\_definition](#output\_build\_definition) | The build definition in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 260,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>  "scope": "Project",<br>  "slug": "blddef"<br>}</pre> | no |
| <a name="output_build_folder"></a> [build\_folder](#output\_build\_folder) | The folder containing the build files in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 260,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>  "scope": "Organization",<br>  "slug": "arpth"<br>}</pre> | no |
| <a name="output_elastic_pool"></a> [elastic\_pool](#output\_elastic\_pool) | The elastic pool used in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 64,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^\u003c,\u003e,%,\u0026,,:,\\,?,/,*,|,\",#,,$,+,.,']*$",<br>  "scope": "Organization",<br>  "slug": "eapool"<br>}</pre> | no |
| <a name="output_environment"></a> [environment](#output\_environment) | The name of the environment in Azure DevOps | <pre>{<br>  "development": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "dbmh-development-apply-adonaming",<br>    "name_unique": "dbmh-development-apply-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envapp"<br>  },<br>  "production": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "dbmh-production-apply-adonaming",<br>    "name_unique": "dbmh-production-apply-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envapp"<br>  },<br>  "user-acceptance-testing": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "dbmh-user-acceptance-testing-apply-adonaming",<br>    "name_unique": "dbmh-user-acceptance-testing-apply-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envapp"<br>  }<br>}</pre> | no |
| <a name="output_environment_apply"></a> [environment\_apply](#output\_environment\_apply) | The name of the environment where apply operations are performed in Azure DevOps | <pre>{<br>  "development": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "dbmh-development-apply-adonaming",<br>    "name_unique": "dbmh-development-apply-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envapp"<br>  },<br>  "production": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "dbmh-production-apply-adonaming",<br>    "name_unique": "dbmh-production-apply-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envapp"<br>  },<br>  "user-acceptance-testing": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "dbmh-user-acceptance-testing-apply-adonaming",<br>    "name_unique": "dbmh-user-acceptance-testing-apply-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envapp"<br>  }<br>}</pre> | no |
| <a name="output_environment_apply_basic"></a> [environment\_apply\_basic](#output\_environment\_apply\_basic) | The basic name of the environment where apply operations are performed in Azure DevOps | <pre>{<br>  "development": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "development-apply",<br>    "name_unique": "development-apply-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envappb"<br>  },<br>  "production": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "production-apply",<br>    "name_unique": "production-apply-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envappb"<br>  },<br>  "user-acceptance-testing": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "user-acceptance-testing-apply",<br>    "name_unique": "user-acceptance-testing-apply-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envappb"<br>  }<br>}</pre> | no |
| <a name="output_environment_basic"></a> [environment\_basic](#output\_environment\_basic) | The basic name of the environment in Azure DevOps | <pre>{<br>  "development": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "development",<br>    "name_unique": "development-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envbas"<br>  },<br>  "production": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "production",<br>    "name_unique": "production-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envbas"<br>  },<br>  "user-acceptance-testing": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "user-acceptance-testing",<br>    "name_unique": "user-acceptance-testing-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envbas"<br>  }<br>}</pre> | no |
| <a name="output_environment_plan"></a> [environment\_plan](#output\_environment\_plan) | The name of the environment where plan operations are performed in Azure DevOps | <pre>{<br>  "development": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "dbmh-development-plan-adonaming",<br>    "name_unique": "dbmh-development-plan-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envpln"<br>  },<br>  "production": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "dbmh-production-plan-adonaming",<br>    "name_unique": "dbmh-production-plan-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envpln"<br>  },<br>  "user-acceptance-testing": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "dbmh-user-acceptance-testing-plan-adonaming",<br>    "name_unique": "dbmh-user-acceptance-testing-plan-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envpln"<br>  }<br>}</pre> | no |
| <a name="output_environment_plan_basic"></a> [environment\_plan\_basic](#output\_environment\_plan\_basic) | The basic name of the environment where plan operations are performed in Azure DevOps | <pre>{<br>  "development": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "development-plan",<br>    "name_unique": "development-plan-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envplnb"<br>  },<br>  "production": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "production-plan",<br>    "name_unique": "production-plan-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envplnb"<br>  },<br>  "user-acceptance-testing": {<br>    "dashes": true,<br>    "max_length": 240,<br>    "min_length": 1,<br>    "name": "user-acceptance-testing-plan",<br>    "name_unique": "user-acceptance-testing-plan-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>    "scope": "Project",<br>    "slug": "envplnb"<br>  }<br>}</pre> | no |
| <a name="output_environment_work_item"></a> [environment\_work\_item](#output\_environment\_work\_item) | The name of the environment associated with work items in Azure DevOps | <pre>{<br>  "development": {<br>    "1234": {<br>      "dashes": true,<br>      "max_length": 240,<br>      "min_length": 1,<br>      "name": "dbmh-development-1234-adonaming",<br>      "name_unique": "dbmh-development-1234-adonaming-h6lf",<br>      "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>      "scope": "Project",<br>      "slug": "envwi"<br>    },<br>    "1235": {<br>      "dashes": true,<br>      "max_length": 240,<br>      "min_length": 1,<br>      "name": "dbmh-development-1235-adonaming",<br>      "name_unique": "dbmh-development-1235-adonaming-h6lf",<br>      "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>      "scope": "Project",<br>      "slug": "envwi"<br>    }<br>  },<br>  "production": {<br>    "1234": {<br>      "dashes": true,<br>      "max_length": 240,<br>      "min_length": 1,<br>      "name": "dbmh-production-1234-adonaming",<br>      "name_unique": "dbmh-production-1234-adonaming-h6lf",<br>      "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>      "scope": "Project",<br>      "slug": "envwi"<br>    },<br>    "1235": {<br>      "dashes": true,<br>      "max_length": 240,<br>      "min_length": 1,<br>      "name": "dbmh-production-1235-adonaming",<br>      "name_unique": "dbmh-production-1235-adonaming-h6lf",<br>      "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>      "scope": "Project",<br>      "slug": "envwi"<br>    }<br>  },<br>  "user-acceptance-testing": {<br>    "1234": {<br>      "dashes": true,<br>      "max_length": 240,<br>      "min_length": 1,<br>      "name": "dbmh-user-acceptance-testing-1234-adonaming",<br>      "name_unique": "dbmh-user-acceptance-testing-1234-adonaming-h6lf",<br>      "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>      "scope": "Project",<br>      "slug": "envwi"<br>    },<br>    "1235": {<br>      "dashes": true,<br>      "max_length": 240,<br>      "min_length": 1,<br>      "name": "dbmh-user-acceptance-testing-1235-adonaming",<br>      "name_unique": "dbmh-user-acceptance-testing-1235-adonaming-h6lf",<br>      "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>      "scope": "Project",<br>      "slug": "envwi"<br>    }<br>  }<br>}</pre> | no |
| <a name="output_environment_work_item_basic"></a> [environment\_work\_item\_basic](#output\_environment\_work\_item\_basic) | The basic name of the environment associated with work items in Azure DevOps | <pre>{<br>  "development": {<br>    "1234": {<br>      "dashes": true,<br>      "max_length": 240,<br>      "min_length": 1,<br>      "name": "development-1234",<br>      "name_unique": "development-1234-adonaming-h6lf",<br>      "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>      "scope": "Project",<br>      "slug": "envwib"<br>    },<br>    "1235": {<br>      "dashes": true,<br>      "max_length": 240,<br>      "min_length": 1,<br>      "name": "development-1235",<br>      "name_unique": "development-1235-adonaming-h6lf",<br>      "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>      "scope": "Project",<br>      "slug": "envwib"<br>    }<br>  },<br>  "production": {<br>    "1234": {<br>      "dashes": true,<br>      "max_length": 240,<br>      "min_length": 1,<br>      "name": "production-1234",<br>      "name_unique": "production-1234-adonaming-h6lf",<br>      "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>      "scope": "Project",<br>      "slug": "envwib"<br>    },<br>    "1235": {<br>      "dashes": true,<br>      "max_length": 240,<br>      "min_length": 1,<br>      "name": "production-1235",<br>      "name_unique": "production-1235-adonaming-h6lf",<br>      "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>      "scope": "Project",<br>      "slug": "envwib"<br>    }<br>  },<br>  "user-acceptance-testing": {<br>    "1234": {<br>      "dashes": true,<br>      "max_length": 240,<br>      "min_length": 1,<br>      "name": "user-acceptance-testing-1234",<br>      "name_unique": "user-acceptance-testing-1234-adonaming-h6lf",<br>      "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>      "scope": "Project",<br>      "slug": "envwib"<br>    },<br>    "1235": {<br>      "dashes": true,<br>      "max_length": 240,<br>      "min_length": 1,<br>      "name": "user-acceptance-testing-1235",<br>      "name_unique": "user-acceptance-testing-1235-adonaming-h6lf",<br>      "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>      "scope": "Project",<br>      "slug": "envwib"<br>    }<br>  }<br>}</pre> | no |
| <a name="output_git_repository"></a> [git\_repository](#output\_git\_repository) | The Git repository in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 64,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "gitrepo"<br>}</pre> | no |
| <a name="output_git_repository_branch"></a> [git\_repository\_branch](#output\_git\_repository\_branch) | The branch of the Git repository in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 255,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>  "scope": "Repository",<br>  "slug": "gitbranch"<br>}</pre> | no |
| <a name="output_git_repository_bug_branch_dash"></a> [git\_repository\_bug\_branch\_dash](#output\_git\_repository\_bug\_branch\_dash) | The bug branch of the Git repository in Azure DevOps, with dashes | <pre>{<br>  "1234": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "bug-1234-dbmh-adonaming",<br>    "name_unique": "bug-1234-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": false,<br>    "slug": "gitbugbr"<br>  },<br>  "1235": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "bug-1235-dbmh-adonaming",<br>    "name_unique": "bug-1235-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": false,<br>    "slug": "gitbugbr"<br>  }<br>}</pre> | no |
| <a name="output_git_repository_bug_branch_slash"></a> [git\_repository\_bug\_branch\_slash](#output\_git\_repository\_bug\_branch\_slash) | The bug branch of the Git repository in Azure DevOps, with slashes | <pre>{<br>  "1234": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "bug/1234-dbmh-adonaming",<br>    "name_unique": "bug/1234-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": true,<br>    "slug": "gitbugbr"<br>  },<br>  "1235": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "bug/1235-dbmh-adonaming",<br>    "name_unique": "bug/1235-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": true,<br>    "slug": "gitbugbr"<br>  }<br>}</pre> | no |
| <a name="output_git_repository_dev_branch_dash"></a> [git\_repository\_dev\_branch\_dash](#output\_git\_repository\_dev\_branch\_dash) | The development branch of the Git repository in Azure DevOps, with dashes | <pre>{<br>  "1234": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "dev-1234-dbmh-adonaming",<br>    "name_unique": "dev-1234-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": false,<br>    "slug": "gitdevbr"<br>  },<br>  "1235": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "dev-1235-dbmh-adonaming",<br>    "name_unique": "dev-1235-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": false,<br>    "slug": "gitdevbr"<br>  }<br>}</pre> | no |
| <a name="output_git_repository_dev_branch_slash"></a> [git\_repository\_dev\_branch\_slash](#output\_git\_repository\_dev\_branch\_slash) | The development branch of the Git repository in Azure DevOps, with slashes | <pre>{<br>  "1234": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "dev/1234-dbmh-adonaming",<br>    "name_unique": "dev/1234-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": true,<br>    "slug": "gitdevbr"<br>  },<br>  "1235": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "dev/1235-dbmh-adonaming",<br>    "name_unique": "dev/1235-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": true,<br>    "slug": "gitdevbr"<br>  }<br>}</pre> | no |
| <a name="output_git_repository_development_branch_dash"></a> [git\_repository\_development\_branch\_dash](#output\_git\_repository\_development\_branch\_dash) | The development branch of the Git repository in Azure DevOps, with dashes | <pre>{<br>  "1234": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "development-1234-dbmh-adonaming",<br>    "name_unique": "development-1234-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": false,<br>    "slug": "gitdevbr"<br>  },<br>  "1235": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "development-1235-dbmh-adonaming",<br>    "name_unique": "development-1235-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": false,<br>    "slug": "gitdevbr"<br>  }<br>}</pre> | no |
| <a name="output_git_repository_development_branch_slash"></a> [git\_repository\_development\_branch\_slash](#output\_git\_repository\_development\_branch\_slash) | The development branch of the Git repository in Azure DevOps, formatted with slashes | <pre>{<br>  "1234": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "development/1234-dbmh-adonaming",<br>    "name_unique": "development/1234-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": true,<br>    "slug": "gitdevbr"<br>  },<br>  "1235": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "development/1235-dbmh-adonaming",<br>    "name_unique": "development/1235-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": true,<br>    "slug": "gitdevbr"<br>  }<br>}</pre> | no |
| <a name="output_git_repository_feature_branch_dash"></a> [git\_repository\_feature\_branch\_dash](#output\_git\_repository\_feature\_branch\_dash) | The feature branch of the Git repository in Azure DevOps, formatted with dashes | <pre>{<br>  "1234": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "feature-1234-dbmh-adonaming",<br>    "name_unique": "feature-1234-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": false,<br>    "slug": "gitfetbr"<br>  },<br>  "1235": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "feature-1235-dbmh-adonaming",<br>    "name_unique": "feature-1235-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": false,<br>    "slug": "gitfetbr"<br>  }<br>}</pre> | no |
| <a name="output_git_repository_feature_branch_slash"></a> [git\_repository\_feature\_branch\_slash](#output\_git\_repository\_feature\_branch\_slash) | The feature branch of the Git repository in Azure DevOps, formatted with slashes | <pre>{<br>  "1234": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "feature/1234-dbmh-adonaming",<br>    "name_unique": "feature/1234-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": true,<br>    "slug": "gitfetbr"<br>  },<br>  "1235": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "feature/1235-dbmh-adonaming",<br>    "name_unique": "feature/1235-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": true,<br>    "slug": "gitfetbr"<br>  }<br>}</pre> | no |
| <a name="output_git_repository_fix_branch_dash"></a> [git\_repository\_fix\_branch\_dash](#output\_git\_repository\_fix\_branch\_dash) | The fix branch of the Git repository in Azure DevOps, formatted with dashes | <pre>{<br>  "1234": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "fix-1234-dbmh-adonaming",<br>    "name_unique": "fix-1234-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": false,<br>    "slug": "gitfixbr"<br>  },<br>  "1235": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "fix-1235-dbmh-adonaming",<br>    "name_unique": "fix-1235-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": false,<br>    "slug": "gitfixbr"<br>  }<br>}</pre> | no |
| <a name="output_git_repository_fix_branch_slash"></a> [git\_repository\_fix\_branch\_slash](#output\_git\_repository\_fix\_branch\_slash) | The fix branch of the Git repository in Azure DevOps, formatted with slashes | <pre>{<br>  "1234": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "fix/1234-dbmh-adonaming",<br>    "name_unique": "fix/1234-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": true,<br>    "slug": "gitfixbr"<br>  },<br>  "1235": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "fix/1235-dbmh-adonaming",<br>    "name_unique": "fix/1235-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": true,<br>    "slug": "gitfixbr"<br>  }<br>}</pre> | no |
| <a name="output_git_repository_hotfix_branch_dash"></a> [git\_repository\_hotfix\_branch\_dash](#output\_git\_repository\_hotfix\_branch\_dash) | The hotfix branch of the Git repository in Azure DevOps, formatted with dashes | <pre>{<br>  "1234": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "hotfix-1234-dbmh-adonaming",<br>    "name_unique": "hotfix-1234-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": false,<br>    "slug": "githotbr"<br>  },<br>  "1235": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "hotfix-1235-dbmh-adonaming",<br>    "name_unique": "hotfix-1235-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": false,<br>    "slug": "githotbr"<br>  }<br>}</pre> | no |
| <a name="output_git_repository_hotfix_branch_slash"></a> [git\_repository\_hotfix\_branch\_slash](#output\_git\_repository\_hotfix\_branch\_slash) | The hotfix branch of the Git repository in Azure DevOps, formatted with slashes | <pre>{<br>  "1234": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "hotfix/1234-dbmh-adonaming",<br>    "name_unique": "hotfix/1234-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": true,<br>    "slug": "githotbr"<br>  },<br>  "1235": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "hotfix/1235-dbmh-adonaming",<br>    "name_unique": "hotfix/1235-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": true,<br>    "slug": "githotbr"<br>  }<br>}</pre> | no |
| <a name="output_git_repository_release_branch_dash"></a> [git\_repository\_release\_branch\_dash](#output\_git\_repository\_release\_branch\_dash) | The release branch of the Git repository in Azure DevOps, formatted with dashes | <pre>{<br>  "1234": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "release-1234-dbmh-adonaming",<br>    "name_unique": "release-1234-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": false,<br>    "slug": "gitrelbr"<br>  },<br>  "1235": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "release-1235-dbmh-adonaming",<br>    "name_unique": "release-1235-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": false,<br>    "slug": "gitrelbr"<br>  }<br>}</pre> | no |
| <a name="output_git_repository_release_branch_slash"></a> [git\_repository\_release\_branch\_slash](#output\_git\_repository\_release\_branch\_slash) | The release branch of the Git repository in Azure DevOps, formatted with slashes | <pre>{<br>  "1234": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "release/1234-dbmh-adonaming",<br>    "name_unique": "release/1234-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": true,<br>    "slug": "gitrelbr"<br>  },<br>  "1235": {<br>    "dashes": true,<br>    "max_length": 255,<br>    "min_length": 1,<br>    "name": "release/1235-dbmh-adonaming",<br>    "name_unique": "release/1235-dbmh-adonaming-h6lf",<br>    "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>    "scope": "Repository",<br>    "slashes": true,<br>    "slug": "gitrelbr"<br>  }<br>}</pre> | no |
| <a name="output_group"></a> [group](#output\_group) | The group in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Organization",<br>  "slug": "grp"<br>}</pre> | no |
| <a name="output_project"></a> [project](#output\_project) | The project in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 64,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^_\\.\\/\\:*?\"\u003c\u003e|;#$*{}+,=\\[\\]\\x00-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "prj"<br>}</pre> | no |
| <a name="output_serviceendpoint_argocd"></a> [serviceendpoint\_argocd](#output\_serviceendpoint\_argocd) | The ArgoCD service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seargocd"<br>}</pre> | no |
| <a name="output_serviceendpoint_artifactory"></a> [serviceendpoint\_artifactory](#output\_serviceendpoint\_artifactory) | The Artifactory service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seart"<br>}</pre> | no |
| <a name="output_serviceendpoint_aws"></a> [serviceendpoint\_aws](#output\_serviceendpoint\_aws) | The AWS service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seaws"<br>}</pre> | no |
| <a name="output_serviceendpoint_azurecr"></a> [serviceendpoint\_azurecr](#output\_serviceendpoint\_azurecr) | The Azure Container Registry service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seazcr"<br>}</pre> | no |
| <a name="output_serviceendpoint_azuredevops"></a> [serviceendpoint\_azuredevops](#output\_serviceendpoint\_azuredevops) | The Azure DevOps service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seazdo"<br>}</pre> | no |
| <a name="output_serviceendpoint_azurerm"></a> [serviceendpoint\_azurerm](#output\_serviceendpoint\_azurerm) | The Azure Resource Manager service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seazrm"<br>}</pre> | no |
| <a name="output_serviceendpoint_bitbucket"></a> [serviceendpoint\_bitbucket](#output\_serviceendpoint\_bitbucket) | The Bitbucket service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sebitb"<br>}</pre> | no |
| <a name="output_serviceendpoint_dockerregistry"></a> [serviceendpoint\_dockerregistry](#output\_serviceendpoint\_dockerregistry) | The Docker Registry service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sedr"<br>}</pre> | no |
| <a name="output_serviceendpoint_externaltfs"></a> [serviceendpoint\_externaltfs](#output\_serviceendpoint\_externaltfs) | The external TFS service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "setfs"<br>}</pre> | no |
| <a name="output_serviceendpoint_gcp_terraform"></a> [serviceendpoint\_gcp\_terraform](#output\_serviceendpoint\_gcp\_terraform) | The GCP Terraform service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "segcptf"<br>}</pre> | no |
| <a name="output_serviceendpoint_generic"></a> [serviceendpoint\_generic](#output\_serviceendpoint\_generic) | The generic service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seg"<br>}</pre> | no |
| <a name="output_serviceendpoint_generic_git"></a> [serviceendpoint\_generic\_git](#output\_serviceendpoint\_generic\_git) | The generic Git service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seggit"<br>}</pre> | no |
| <a name="output_serviceendpoint_github"></a> [serviceendpoint\_github](#output\_serviceendpoint\_github) | The GitHub service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "segh"<br>}</pre> | no |
| <a name="output_serviceendpoint_github_enterprise"></a> [serviceendpoint\_github\_enterprise](#output\_serviceendpoint\_github\_enterprise) | The GitHub Enterprise service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "segh"<br>}</pre> | no |
| <a name="output_serviceendpoint_incomingwebhook"></a> [serviceendpoint\_incomingwebhook](#output\_serviceendpoint\_incomingwebhook) | The incoming webhook service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seiw"<br>}</pre> | no |
| <a name="output_serviceendpoint_jenkins"></a> [serviceendpoint\_jenkins](#output\_serviceendpoint\_jenkins) | The Jenkins service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sej"<br>}</pre> | no |
| <a name="output_serviceendpoint_jfrog_artifactory_v2"></a> [serviceendpoint\_jfrog\_artifactory\_v2](#output\_serviceendpoint\_jfrog\_artifactory\_v2) | The JFrog Artifactory v2 service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sejfa"<br>}</pre> | no |
| <a name="output_serviceendpoint_jfrog_distribution_v2"></a> [serviceendpoint\_jfrog\_distribution\_v2](#output\_serviceendpoint\_jfrog\_distribution\_v2) | The JFrog Distribution v2 service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sejfd"<br>}</pre> | no |
| <a name="output_serviceendpoint_jfrog_platform_v2"></a> [serviceendpoint\_jfrog\_platform\_v2](#output\_serviceendpoint\_jfrog\_platform\_v2) | The JFrog Platform v2 service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sejfp"<br>}</pre> | no |
| <a name="output_serviceendpoint_jfrog_xray_v2"></a> [serviceendpoint\_jfrog\_xray\_v2](#output\_serviceendpoint\_jfrog\_xray\_v2) | The JFrog Xray v2 service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sejx"<br>}</pre> | no |
| <a name="output_serviceendpoint_kubernetes"></a> [serviceendpoint\_kubernetes](#output\_serviceendpoint\_kubernetes) | The Kubernetes service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sek"<br>}</pre> | no |
| <a name="output_serviceendpoint_maven"></a> [serviceendpoint\_maven](#output\_serviceendpoint\_maven) | The Maven service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "semvn"<br>}</pre> | no |
| <a name="output_serviceendpoint_nexus"></a> [serviceendpoint\_nexus](#output\_serviceendpoint\_nexus) | The Nexus service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sen"<br>}</pre> | no |
| <a name="output_serviceendpoint_npm"></a> [serviceendpoint\_npm](#output\_serviceendpoint\_npm) | The NPM service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "senpm"<br>}</pre> | no |
| <a name="output_serviceendpoint_nuget"></a> [serviceendpoint\_nuget](#output\_serviceendpoint\_nuget) | The NuGet service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "senug"<br>}</pre> | no |
| <a name="output_serviceendpoint_octopusdeploy"></a> [serviceendpoint\_octopusdeploy](#output\_serviceendpoint\_octopusdeploy) | The Octopus Deploy service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seod"<br>}</pre> | no |
| <a name="output_serviceendpoint_runpipeline"></a> [serviceendpoint\_runpipeline](#output\_serviceendpoint\_runpipeline) | The Run Pipeline service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "serp"<br>}</pre> | no |
| <a name="output_serviceendpoint_servicefabric"></a> [serviceendpoint\_servicefabric](#output\_serviceendpoint\_servicefabric) | The Service Fabric service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sesf"<br>}</pre> | no |
| <a name="output_serviceendpoint_sonarcloud"></a> [serviceendpoint\_sonarcloud](#output\_serviceendpoint\_sonarcloud) | The SonarCloud service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sesc"<br>}</pre> | no |
| <a name="output_serviceendpoint_sonarqube"></a> [serviceendpoint\_sonarqube](#output\_serviceendpoint\_sonarqube) | The SonarQube service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sesq"<br>}</pre> | no |
| <a name="output_serviceendpoint_ssh"></a> [serviceendpoint\_ssh](#output\_serviceendpoint\_ssh) | The SSH service endpoint in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sessh"<br>}</pre> | no |
| <a name="output_team"></a> [team](#output\_team) | The team in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 255,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "adt"<br>}</pre> | no |
| <a name="output_unique_seed"></a> [unique\_seed](#output\_unique\_seed) | A custom value for generating random characters, used when a unique seed is not provided | `"h6lft43juihfyd9pp0qi3hldl6evepm2su9aztf5mqnyuwzzx48lniw479adc"` | no |
| <a name="output_validation"></a> [validation](#output\_validation) | The validation rules that have been applied | <pre>{<br>  "agent_pool": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "branch_policy_build_validation": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "build_definition": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "elastic_pool": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "environment": {<br>    "development": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "production": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "user-acceptance-testing": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    }<br>  },<br>  "environment_apply": {<br>    "development": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "production": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "user-acceptance-testing": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    }<br>  },<br>  "environment_apply_basic": {<br>    "development": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "production": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "user-acceptance-testing": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    }<br>  },<br>  "environment_basic": {<br>    "development": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "production": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "user-acceptance-testing": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    }<br>  },<br>  "environment_plan": {<br>    "development": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "production": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "user-acceptance-testing": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    }<br>  },<br>  "environment_plan_basic": {<br>    "development": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "production": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "user-acceptance-testing": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    }<br>  },<br>  "environment_work_item": {<br>    "development": {<br>      "1234": {<br>        "dashes": true,<br>        "max_length": 240,<br>        "min_length": 1,<br>        "name": "dbmh-development-1234-adonaming",<br>        "name_unique": "dbmh-development-1234-adonaming-h6lf",<br>        "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>        "scope": "Project",<br>        "slug": "envwi"<br>      },<br>      "1235": {<br>        "dashes": true,<br>        "max_length": 240,<br>        "min_length": 1,<br>        "name": "dbmh-development-1235-adonaming",<br>        "name_unique": "dbmh-development-1235-adonaming-h6lf",<br>        "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>        "scope": "Project",<br>        "slug": "envwi"<br>      }<br>    },<br>    "production": {<br>      "1234": {<br>        "dashes": true,<br>        "max_length": 240,<br>        "min_length": 1,<br>        "name": "dbmh-production-1234-adonaming",<br>        "name_unique": "dbmh-production-1234-adonaming-h6lf",<br>        "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>        "scope": "Project",<br>        "slug": "envwi"<br>      },<br>      "1235": {<br>        "dashes": true,<br>        "max_length": 240,<br>        "min_length": 1,<br>        "name": "dbmh-production-1235-adonaming",<br>        "name_unique": "dbmh-production-1235-adonaming-h6lf",<br>        "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>        "scope": "Project",<br>        "slug": "envwi"<br>      }<br>    },<br>    "user-acceptance-testing": {<br>      "1234": {<br>        "dashes": true,<br>        "max_length": 240,<br>        "min_length": 1,<br>        "name": "dbmh-user-acceptance-testing-1234-adonaming",<br>        "name_unique": "dbmh-user-acceptance-testing-1234-adonaming-h6lf",<br>        "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>        "scope": "Project",<br>        "slug": "envwi"<br>      },<br>      "1235": {<br>        "dashes": true,<br>        "max_length": 240,<br>        "min_length": 1,<br>        "name": "dbmh-user-acceptance-testing-1235-adonaming",<br>        "name_unique": "dbmh-user-acceptance-testing-1235-adonaming-h6lf",<br>        "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>        "scope": "Project",<br>        "slug": "envwi"<br>      }<br>    }<br>  },<br>  "environment_work_item_basic": {<br>    "development": {<br>      "1234": {<br>        "valid_name": true,<br>        "valid_name_unique": true<br>      },<br>      "1235": {<br>        "valid_name": true,<br>        "valid_name_unique": true<br>      }<br>    },<br>    "production": {<br>      "1234": {<br>        "valid_name": true,<br>        "valid_name_unique": true<br>      },<br>      "1235": {<br>        "valid_name": true,<br>        "valid_name_unique": true<br>      }<br>    },<br>    "user-acceptance-testing": {<br>      "1234": {<br>        "valid_name": true,<br>        "valid_name_unique": true<br>      },<br>      "1235": {<br>        "valid_name": true,<br>        "valid_name_unique": true<br>      }<br>    }<br>  },<br>  "git_repository": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "git_repository_branch": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "git_repository_bug_branch_dash": {<br>    "1234": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "1235": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    }<br>  },<br>  "git_repository_bug_branch_slash": {<br>    "1234": {<br>      "valid_name": false,<br>      "valid_name_unique": false<br>    },<br>    "1235": {<br>      "valid_name": false,<br>      "valid_name_unique": false<br>    }<br>  },<br>  "git_repository_dev_branch_dash": {<br>    "1234": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "1235": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    }<br>  },<br>  "git_repository_dev_branch_slash": {<br>    "1234": {<br>      "valid_name": false,<br>      "valid_name_unique": false<br>    },<br>    "1235": {<br>      "valid_name": false,<br>      "valid_name_unique": false<br>    }<br>  },<br>  "git_repository_development_branch_dash": {<br>    "1234": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "1235": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    }<br>  },<br>  "git_repository_development_branch_slash": {<br>    "1234": {<br>      "valid_name": false,<br>      "valid_name_unique": false<br>    },<br>    "1235": {<br>      "valid_name": false,<br>      "valid_name_unique": false<br>    }<br>  },<br>  "git_repository_feature_branch_dash": {<br>    "1234": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "1235": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    }<br>  },<br>  "git_repository_feature_branch_slash": {<br>    "1234": {<br>      "valid_name": false,<br>      "valid_name_unique": false<br>    },<br>    "1235": {<br>      "valid_name": false,<br>      "valid_name_unique": false<br>    }<br>  },<br>  "git_repository_fix_branch_dash": {<br>    "1234": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "1235": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    }<br>  },<br>  "git_repository_fix_branch_slash": {<br>    "1234": {<br>      "valid_name": false,<br>      "valid_name_unique": false<br>    },<br>    "1235": {<br>      "valid_name": false,<br>      "valid_name_unique": false<br>    }<br>  },<br>  "git_repository_hotfix_branch_dash": {<br>    "1234": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "1235": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    }<br>  },<br>  "git_repository_hotfix_branch_slash": {<br>    "1234": {<br>      "valid_name": false,<br>      "valid_name_unique": false<br>    },<br>    "1235": {<br>      "valid_name": false,<br>      "valid_name_unique": false<br>    }<br>  },<br>  "git_repository_release_branch_dash": {<br>    "1234": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "1235": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    }<br>  },<br>  "git_repository_release_branch_slash": {<br>    "1234": {<br>      "valid_name": false,<br>      "valid_name_unique": false<br>    },<br>    "1235": {<br>      "valid_name": false,<br>      "valid_name_unique": false<br>    }<br>  },<br>  "git_repository_support_branch_dash": {<br>    "1234": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    },<br>    "1235": {<br>      "valid_name": true,<br>      "valid_name_unique": true<br>    }<br>  },<br>  "git_repository_support_branch_slash": {<br>    "1234": {<br>      "valid_name": false,<br>      "valid_name_unique": false<br>    },<br>    "1235": {<br>      "valid_name": false,<br>      "valid_name_unique": false<br>    }<br>  },<br>  "group": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "project": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_argocd": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_artifactory": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_aws": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_azurecr": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_azuredevops": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_azurerm": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_bitbucket": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_dockerregistry": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_externaltfs": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_gcp_terraform": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_generic": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_generic_git": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_github": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_github_enterprise": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_incomingwebhook": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_jenkins": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_jfrog_artifactory_v2": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_jfrog_distribution_v2": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_jfrog_platform_v2": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_jfrog_xray_v2": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_kubernetes": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_maven": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_nexus": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_npm": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_nuget": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_octopusdeploy": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_runpipeline": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_servicefabric": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_sonarcloud": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_sonarqube": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_ssh": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "team": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "variable_group": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  }<br>}</pre> | no |
| <a name="output_variable_group"></a> [variable\_group](#output\_variable\_group) | The variable group in Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 256,<br>  "min_length": 1,<br>  "name": "dbmh-adonaming",<br>  "name_unique": "dbmh-adonaming-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "advg"<br>}</pre> | no |

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

### Modules

No modules.

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
tfupdate terraform . --version "~> $(tfupdate release latest hashicorp/terraform)" --recursive
```

please also add the terraform version to the `terraform_installer_version` variable in `build/pipelines/iac_templates/variables.yml`

##### Random version

```shell
tfupdate provider random . --version "~> $(tfupdate release latest hashicorp/random --source-type tfregistryProvider)" --recursive
```

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---
<!-- end_of_terraform_docs -->
<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- markdown-table-prettify-ignore-end -->

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

<!-- ROADMAP -->

## Roadmap

- [x] Support majority of Azure DevOps resources
- [x] Test validation rules
- [x] Include output examples in docs
- [x] Different branch types to satisfy gitversion
- [x] Additional examples in docs
- [ ] Feature 3
  - [ ] Nested Feature

See the [issues][issues] for a full list of proposed features (and known issues).

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

<!-- CONTRIBUTING -->

## Contributing

**All are encouraged to contribute**
Contributions are what make the open source community such a great way to learn,
inspire, and create.
Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please create a branch and
create a pull request. You can also simply open an issue with the tag "enhancement".

Don't forget to give the project a star! Thanks again!

1. Clone the Repo (`git clone https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming`)
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

**NOTE:** This repo has tagged releases where the version  is generated by gitversion.
You can increment the release version by adding to your commit message as follows:

Adding +semver: breaking or +semver: major will cause the major version to be increased,
+semver: feature or +semver: minor will bump minor and +semver: patch
or +semver: fix will bump the patch.
[source][gitversion_website]

---

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

To work with this repo we recommend you install the tools
that are included in the prerequisites.
However, you may work on the repo in the browser if you prefer.

### Contributing Prerequisites

To replicate the setup used to initially create this repository you will need

1. Clone the Repo

   ```sh
   git clone https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming.git
   ```

2. Install pip

   ```cmd
   curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
   python get-pip.py
   ```

3. Install Chocolatey

   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   ```

4. Install Terraform

   ```cmd
   choco install terraform
   ```

5. Install TFlint

   ```cmd
   choco install tflint
   ```

   Also download the tflint plugins from github such as
   [tflint-ruleset-azurerm][tflint-ruleset-azurerm] and [tflint-ruleset-aws][tflint-ruleset-aws]
   put these  in your `.tflint.d/plugins` directory at the root of your user directory

6. Install terraform-docs

   ```cmd
   choco install terraform-docs
   ```

7. Install pre-commit

   ```cmd
   pip install pre-commit
   ```

8. Install vscode

   ```cmd
   choco install vscode
   ```

9. Install tfupdate

Download the latest compiled binaries from [here][tfupdate_releases]
then put it in your executable path.

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

<!-- LICENSE -->

## License

This module is licensed under the MIT license which can be found here: [LICENSE.md]
---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

<!-- CONTACT -->

## Contact

Rolf Moleman - @RolfMoleman

Module Link: [https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming](https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming)

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- URLs -->

[gitversion_website]: https://gitversion.net/docs/reference/version-increments
[issues]: https://github.com/DownAtTheBottomOfTheMoleHole/terraform-azuredevops-naming/issues
[tfupdate_releases]: https://github.com/minamijoyo/tfupdate/releases

[tflint-ruleset-aws]: https://github.com/terraform-linters/tflint-ruleset-aws/releases
[tflint-ruleset-azurerm]: https://github.com/terraform-linters/tflint-ruleset-azurerm/releases

<!-- IMAGES AND ICONS -->

[LICENSE.md]: ./LICENSE.md
[logo-image]: ./.assets/RolfMoleman.png
