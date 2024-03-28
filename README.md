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
  - [This module is licensed under the MIT locese which can be found here: LICENSE.md](#this-module-is-licensed-under-the-mit-locese-which-can-be-found-here-licensemd)
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
- [Mermaid](https://mermaid.live/)
- [Pre-Commit](https://pre-commit.com/)
- [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)
- [prettier](https://github.com/prettier/prettier)
- [Terraform](https://www.terraform.io/)
- [Terraform-docs](https://github.com/terraform-docs/terraform-docs)
- [Terrascan](https://github.com/tenable/terrascan)
- [tflint](https://github.com/terraform-linters/tflint)
- [tfsec](https://github.com/aquasecurity/tfsec)
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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.7.5 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.0 |

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

<!-- consuming terraform-azuredevops-naming -->
### Consuming terraform-azuredevops-naming

  To consume this module add the following to your module.tf:
```hcl
  module "terraform-azuredevops-naming" {
    	 source  = "DownAtTheBottomOfTheMoleHole/naming/azuredevops"
    	 version  = "1.0.2"
    
	 # Optional variables
    	 prefix  = []
    	 suffix  = []
    	 unique_include_numbers  = true
    	 unique_length  = 4
    	 unique_seed  = ""
  }
  ```

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

### Resources

| Name | Type |
|------|------|
| [random_string.first_letter](https://registry.terraform.io/providers/hashicorp/random/3.6.0/docs/resources/string) | resource |
| [random_string.main](https://registry.terraform.io/providers/hashicorp/random/3.6.0/docs/resources/string) | resource |

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_prefix"></a> [prefix](#input\_prefix) | It is not recommended that you use prefix by azure you should be using a suffix for your resources. | `list(string)` | `[]` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | It is recommended that you specify a suffix for consistency. please use only lowercase characters when possible | `list(string)` | `[]` | no |
| <a name="input_unique_include_numbers"></a> [unique\_include\_numbers](#input\_unique\_include\_numbers) | If you want to include numbers in the unique generation | `bool` | `true` | no |
| <a name="input_unique_length"></a> [unique\_length](#input\_unique\_length) | Max length of the uniqueness suffix to be added | `number` | `4` | no |
| <a name="input_unique_seed"></a> [unique\_seed](#input\_unique\_seed) | Custom value for the random characters to be used | `string` | `""` | no |

---

<!-- Readme Navigation -->

[(Back to the Table of Contents)](#table-of-contents)

---

### Outputs

| Name | Description | Value | Sensitive |
|------|-------------|-------|:---------:|
| <a name="output_area_path"></a> [area\_path](#output\_area\_path) | Azure DevOps Area Path | <pre>{<br>  "dashes": true,<br>  "max_length": 255,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\\/\\:*?\"\u003c\u003e|#$*+\\x00-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "arpth"<br>}</pre> | no |
| <a name="output_artifact"></a> [artifact](#output\_artifact) | Azure DevOps Artifact | <pre>{<br>  "dashes": true,<br>  "max_length": 256,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[a-z0-9_.-]+$",<br>  "scope": "Organization",<br>  "slug": "art"<br>}</pre> | no |
| <a name="output_board_column"></a> [board\_column](#output\_board\_column) | Azure DevOps Board Column | <pre>{<br>  "dashes": true,<br>  "max_length": 256,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\\x00-\\x1F]{1,256}$",<br>  "scope": "Organization",<br>  "slug": "brdcol"<br>}</pre> | no |
| <a name="output_board_swimlane"></a> [board\_swimlane](#output\_board\_swimlane) | Azure DevOps Board Swimlane | <pre>{<br>  "dashes": true,<br>  "max_length": 256,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\\x00-\\x1F]{1,256}$",<br>  "scope": "Organization",<br>  "slug": "brdswm"<br>}</pre> | no |
| <a name="output_field_name"></a> [field\_name](#output\_field\_name) | Azure DevOps Field Name | <pre>{<br>  "dashes": true,<br>  "max_length": 128,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^ .,;':~\\/\\*|?\"\u0026%$!+=()\\[\\]{}\u003c\u003e-]*$",<br>  "scope": "Organization",<br>  "slug": "fld"<br>}</pre> | no |
| <a name="output_git_repo"></a> [git\_repo](#output\_git\_repo) | Azure DevOps Git Repository | <pre>{<br>  "dashes": true,<br>  "max_length": 64,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\\/\\:*?\"\u003c\u003e|;#$*{}+,=\\[\\]\\x00-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "gitrepo"<br>}</pre> | no |
| <a name="output_iteration_path"></a> [iteration\_path](#output\_iteration\_path) | Azure DevOps Iteration Path | <pre>{<br>  "dashes": true,<br>  "max_length": 255,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\\/\\:*?\"\u003c\u003e|#$*+\\x00-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "itpth"<br>}</pre> | no |
| <a name="output_organization"></a> [organization](#output\_organization) | Azure DevOps Organization | <pre>{<br>  "dashes": true,<br>  "max_length": 50,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[a-z0-9]([-a-z0-9]*[a-z0-9])?$",<br>  "scope": "AzureDevOps",<br>  "slug": "org"<br>}</pre> | no |
| <a name="output_pipeline_expression"></a> [pipeline\_expression](#output\_pipeline\_expression) | Azure DevOps Pipeline Expression | <pre>{<br>  "dashes": true,<br>  "max_length": 256,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\\/\\:*?\"\u003c\u003e|;#$*{}+,=\\[\\]\\x00-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "pexp"<br>}</pre> | no |
| <a name="output_pipeline_job"></a> [pipeline\_job](#output\_pipeline\_job) | Azure DevOps Pipeline job Name | <pre>{<br>  "dashes": true,<br>  "max_length": 256,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\\/\\:*?\"\u003c\u003e|;#$*{}+,=\\[\\]\\x00-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "pljob"<br>}</pre> | no |
| <a name="output_pipeline_stage"></a> [pipeline\_stage](#output\_pipeline\_stage) | Azure DevOps Pipeline atage Name | <pre>{<br>  "dashes": true,<br>  "max_length": 256,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\\/\\:*?\"\u003c\u003e|;#$*{}+,=\\[\\]\\x00-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "plstg"<br>}</pre> | no |
| <a name="output_process"></a> [process](#output\_process) | Azure DevOps Process | <pre>{<br>  "dashes": true,<br>  "max_length": 256,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\\x00-\\x1F]{1,256}$",<br>  "scope": "AzureDevOps",<br>  "slug": "proc"<br>}</pre> | no |
| <a name="output_project"></a> [project](#output\_project) | Azure DevOps Project | <pre>{<br>  "dashes": true,<br>  "max_length": 64,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^_\\.\\/\\:*?\"\u003c\u003e|;#$*{}+,=\\[\\]\\x00-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "prj"<br>}</pre> | no |
| <a name="output_security_group"></a> [security\_group](#output\_security\_group) | Azure Security Group | <pre>{<br>  "dashes": true,<br>  "max_length": 256,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\\/\\[\\]:|\u003c\u003e+=;?*,\\x01-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "secgrp"<br>}</pre> | no |
| <a name="output_team"></a> [team](#output\_team) | Azure DevOps Team | <pre>{<br>  "dashes": true,<br>  "max_length": 64,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^_\\.\\.\\.\\/\\:*?\"\u003c\u003e|;#$*{}+,=\\[\\]\\x00-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "team"<br>}</pre> | no |
| <a name="output_tfvc_file"></a> [tfvc\_file](#output\_tfvc\_file) | Azure DevOps TFVC File | <pre>{<br>  "dashes": true,<br>  "max_length": 260,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\\/\\:*?\"\u003c\u003e|;#$*{}+,=\\[\\]\\x00-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "tfvcfile"<br>}</pre> | no |
| <a name="output_tfvc_label"></a> [tfvc\_label](#output\_tfvc\_label) | Azure DevOps TFVC Label | <pre>{<br>  "dashes": true,<br>  "max_length": 64,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\\/\\:*?\"\u003c\u003e|;#$*{}+,=\\[\\]\\x00-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "tfvclbl"<br>}</pre> | no |
| <a name="output_tfvc_repo"></a> [tfvc\_repo](#output\_tfvc\_repo) | Azure DevOps TFVC repo | <pre>{<br>  "dashes": true,<br>  "max_length": 64,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\\/\\:*?\"\u003c\u003e|;#$*{}+,=\\[\\]\\x00-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "tfvcrepo"<br>}</pre> | no |
| <a name="output_tfvc_shelveset"></a> [tfvc\_shelveset](#output\_tfvc\_shelveset) | Azure DevOps TFVC Shelveset | <pre>{<br>  "dashes": true,<br>  "max_length": 64,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\\/\\:*?\"\u003c\u003e|;#$*{}+,=\\[\\]\\x00-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "tfvcss"<br>}</pre> | no |
| <a name="output_tfvc_workspace"></a> [tfvc\_workspace](#output\_tfvc\_workspace) | Azure DevOps TFVC Workspace | <pre>{<br>  "dashes": true,<br>  "max_length": 64,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\\/\\:*?\"\u003c\u003e|;#$*{}+,=\\[\\]\\x00-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "tfvcws"<br>}</pre> | no |
| <a name="output_unique_seed"></a> [unique\_seed](#output\_unique\_seed) | Custom value for the random characters to be used | `"h6lft43juihfyd9pp0qi3hldl6evepm2su9aztf5mqnyuwzzx48lniw479adc"` | no |
| <a name="output_validation"></a> [validation](#output\_validation) | Validation rules applied | <pre>{<br>  "area_path": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "artifact": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "board_column": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "board_swimlane": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "filed_name": {<br>    "valid_name": false,<br>    "valid_name_unique": false<br>  },<br>  "git_repo": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "iteration_path": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "organization": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "pipeline_expression": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "pipeline_job": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "pipeline_stage": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "process": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "project": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "security_group": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "team": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "tfvc_file": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "tfvc_label": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "tfvc_repo": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "tfvc_shelveset": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "tfvc_workspace": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "work_item_tag": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  }<br>}</pre> | no |
| <a name="output_work_item_tag"></a> [work\_item\_tag](#output\_work\_item\_tag) | Azure DevOps Work Item Tag | <pre>{<br>  "dashes": true,<br>  "max_length": 64,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\\/\\:*?\"\u003c\u003e|;#$*{}+,=\\[\\]\\x00-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "witg"<br>}</pre> | no |

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

This module is licensed under the MIT locese which can be found here: [LICENSE.md]
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
