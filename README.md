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
| <a name="output_agent_pool"></a> [agent\_pool](#output\_agent\_pool) | Agent Pool | <pre>{<br>  "dashes": true,<br>  "max_length": 64,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\u003c,\u003e,%,\u0026,,:,\\,?,/,*,|,\",#,$,+,.,']*$",<br>  "scope": "Organization",<br>  "slug": "agtpol"<br>}</pre> | no |
| <a name="output_branch_policy_build_validation"></a> [branch\_policy\_build\_validation](#output\_branch\_policy\_build\_validation) | Branch Policy Build Validation display name | <pre>{<br>  "dashes": true,<br>  "max_length": 256,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/:\\~\u0026%;@'\"?\u003c\u003e|#$*}{,+=\\[\\]]*$",<br>  "scope": "repository",<br>  "slug": "bpbv"<br>}</pre> | no |
| <a name="output_build_definition"></a> [build\_definition](#output\_build\_definition) | Build Definition | <pre>{<br>  "dashes": true,<br>  "max_length": 260,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>  "scope": "Project",<br>  "slug": "blddef"<br>}</pre> | no |
| <a name="output_build_folder"></a> [build\_folder](#output\_build\_folder) | Build Folder | <pre>{<br>  "dashes": true,<br>  "max_length": 260,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>  "scope": "Organization",<br>  "slug": "arpth"<br>}</pre> | no |
| <a name="output_elastic_pool"></a> [elastic\_pool](#output\_elastic\_pool) | Elastic Pool | <pre>{<br>  "dashes": true,<br>  "max_length": 64,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^\u003c,\u003e,%,\u0026,,:,\\,?,/,*,|,\",#,,$,+,.,']*$",<br>  "scope": "Organization",<br>  "slug": "eapool"<br>}</pre> | no |
| <a name="output_environment"></a> [environment](#output\_environment) | Environment | <pre>{<br>  "dashes": true,<br>  "max_length": 240,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|]*$",<br>  "scope": "Project",<br>  "slug": "env"<br>}</pre> | no |
| <a name="output_git_repository"></a> [git\_repository](#output\_git\_repository) | Git Repository | <pre>{<br>  "dashes": true,<br>  "max_length": 64,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "gitrepo"<br>}</pre> | no |
| <a name="output_git_repository_branch"></a> [git\_repository\_branch](#output\_git\_repository\_branch) | Git Repository Branch | <pre>{<br>  "dashes": true,<br>  "max_length": 255,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=\\x00-\\x1F\\x7F]+$",<br>  "scope": "Repository",<br>  "slug": "gitbranch"<br>}</pre> | no |
| <a name="output_group"></a> [group](#output\_group) | Group | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Organization",<br>  "slug": "grp"<br>}</pre> | no |
| <a name="output_project"></a> [project](#output\_project) | Project | <pre>{<br>  "dashes": true,<br>  "max_length": 64,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^_\\.\\/\\:*?\"\u003c\u003e|;#$*{}+,=\\[\\]\\x00-\\x1F]*$",<br>  "scope": "Organization",<br>  "slug": "prj"<br>}</pre> | no |
| <a name="output_serviceendpoint_argocd"></a> [serviceendpoint\_argocd](#output\_serviceendpoint\_argocd) | Service Endpoint Argocd | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seargocd"<br>}</pre> | no |
| <a name="output_serviceendpoint_artifactory"></a> [serviceendpoint\_artifactory](#output\_serviceendpoint\_artifactory) | Service Endpoint Artifactory | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seart"<br>}</pre> | no |
| <a name="output_serviceendpoint_aws"></a> [serviceendpoint\_aws](#output\_serviceendpoint\_aws) | Service Endpoint AWS | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seaws"<br>}</pre> | no |
| <a name="output_serviceendpoint_azurecr"></a> [serviceendpoint\_azurecr](#output\_serviceendpoint\_azurecr) | Service Endpoint Azure Container Registry | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seazcr"<br>}</pre> | no |
| <a name="output_serviceendpoint_azuredevops"></a> [serviceendpoint\_azuredevops](#output\_serviceendpoint\_azuredevops) | Service Endpoint Azure DevOps | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seazdo"<br>}</pre> | no |
| <a name="output_serviceendpoint_azurerm"></a> [serviceendpoint\_azurerm](#output\_serviceendpoint\_azurerm) | Service Endpoint AzureRM | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seazrm"<br>}</pre> | no |
| <a name="output_serviceendpoint_bitbucket"></a> [serviceendpoint\_bitbucket](#output\_serviceendpoint\_bitbucket) | Service Endpoint Bitbucket | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sebitb"<br>}</pre> | no |
| <a name="output_serviceendpoint_dockerregistry"></a> [serviceendpoint\_dockerregistry](#output\_serviceendpoint\_dockerregistry) | Service Endpoint Docker Registry | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sedr"<br>}</pre> | no |
| <a name="output_serviceendpoint_externaltfs"></a> [serviceendpoint\_externaltfs](#output\_serviceendpoint\_externaltfs) | Service Endpoint External TFS | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "setfs"<br>}</pre> | no |
| <a name="output_serviceendpoint_gcp_terraform"></a> [serviceendpoint\_gcp\_terraform](#output\_serviceendpoint\_gcp\_terraform) | Service Endpoint GCP Terraform | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "segcptf"<br>}</pre> | no |
| <a name="output_serviceendpoint_generic"></a> [serviceendpoint\_generic](#output\_serviceendpoint\_generic) | Service Endpoint Generic | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seg"<br>}</pre> | no |
| <a name="output_serviceendpoint_generic_git"></a> [serviceendpoint\_generic\_git](#output\_serviceendpoint\_generic\_git) | Service Endpoint Generic Git | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seggit"<br>}</pre> | no |
| <a name="output_serviceendpoint_github"></a> [serviceendpoint\_github](#output\_serviceendpoint\_github) | Service Endpoint GitHub | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "segh"<br>}</pre> | no |
| <a name="output_serviceendpoint_github_enterprise"></a> [serviceendpoint\_github\_enterprise](#output\_serviceendpoint\_github\_enterprise) | Service Endpoint GitHub Enterprise | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "segh"<br>}</pre> | no |
| <a name="output_serviceendpoint_incomingwebhook"></a> [serviceendpoint\_incomingwebhook](#output\_serviceendpoint\_incomingwebhook) | Service Endpoint Incoming Webhook | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seiw"<br>}</pre> | no |
| <a name="output_serviceendpoint_jenkins"></a> [serviceendpoint\_jenkins](#output\_serviceendpoint\_jenkins) | Service Endpoint Jenkins | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sej"<br>}</pre> | no |
| <a name="output_serviceendpoint_jfrog_artifactory_v2"></a> [serviceendpoint\_jfrog\_artifactory\_v2](#output\_serviceendpoint\_jfrog\_artifactory\_v2) | Service Endpoint JFrog Artifactory v2 | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sejfa"<br>}</pre> | no |
| <a name="output_serviceendpoint_jfrog_distribution_v2"></a> [serviceendpoint\_jfrog\_distribution\_v2](#output\_serviceendpoint\_jfrog\_distribution\_v2) | Service Endpoint JFrog Distribution v2 | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sejfd"<br>}</pre> | no |
| <a name="output_serviceendpoint_jfrog_platform_v2"></a> [serviceendpoint\_jfrog\_platform\_v2](#output\_serviceendpoint\_jfrog\_platform\_v2) | Service Endpoint Platform v2 | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sejfp"<br>}</pre> | no |
| <a name="output_serviceendpoint_jfrog_xray_v2"></a> [serviceendpoint\_jfrog\_xray\_v2](#output\_serviceendpoint\_jfrog\_xray\_v2) | Service Endpoint Xray v2 | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sejx"<br>}</pre> | no |
| <a name="output_serviceendpoint_kubernetes"></a> [serviceendpoint\_kubernetes](#output\_serviceendpoint\_kubernetes) | Service Endpoint Kubernetes | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sek"<br>}</pre> | no |
| <a name="output_serviceendpoint_maven"></a> [serviceendpoint\_maven](#output\_serviceendpoint\_maven) | Service Endpoint Maven | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "semvn"<br>}</pre> | no |
| <a name="output_serviceendpoint_nexus"></a> [serviceendpoint\_nexus](#output\_serviceendpoint\_nexus) | Service Endpoint Nexus | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sen"<br>}</pre> | no |
| <a name="output_serviceendpoint_npm"></a> [serviceendpoint\_npm](#output\_serviceendpoint\_npm) | Service Endpoint NPM | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "senpm"<br>}</pre> | no |
| <a name="output_serviceendpoint_nuget"></a> [serviceendpoint\_nuget](#output\_serviceendpoint\_nuget) | Service Endpoint NuGet | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "senug"<br>}</pre> | no |
| <a name="output_serviceendpoint_octopusdeploy"></a> [serviceendpoint\_octopusdeploy](#output\_serviceendpoint\_octopusdeploy) | Service Endpoint Octopus Deploy | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "seod"<br>}</pre> | no |
| <a name="output_serviceendpoint_runpipeline"></a> [serviceendpoint\_runpipeline](#output\_serviceendpoint\_runpipeline) | Service Endpoint Run Pipeline | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "serp"<br>}</pre> | no |
| <a name="output_serviceendpoint_servicefabric"></a> [serviceendpoint\_servicefabric](#output\_serviceendpoint\_servicefabric) | Service Endpoint Service Fabric | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sesf"<br>}</pre> | no |
| <a name="output_serviceendpoint_sonarcloud"></a> [serviceendpoint\_sonarcloud](#output\_serviceendpoint\_sonarcloud) | Service Endpoint SonarCloud | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sesc"<br>}</pre> | no |
| <a name="output_serviceendpoint_sonarqube"></a> [serviceendpoint\_sonarqube](#output\_serviceendpoint\_sonarqube) | Service Endpoint SonarQube | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sesq"<br>}</pre> | no |
| <a name="output_serviceendpoint_ssh"></a> [serviceendpoint\_ssh](#output\_serviceendpoint\_ssh) | Service Endpoint SSH | <pre>{<br>  "dashes": true,<br>  "max_length": 1024,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "sessh"<br>}</pre> | no |
| <a name="output_team"></a> [team](#output\_team) | Team | <pre>{<br>  "dashes": true,<br>  "max_length": 255,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "adt"<br>}</pre> | no |
| <a name="output_unique_seed"></a> [unique\_seed](#output\_unique\_seed) | Custom value for the random characters to be used | `"h6lft43juihfyd9pp0qi3hldl6evepm2su9aztf5mqnyuwzzx48lniw479adc"` | no |
| <a name="output_validation"></a> [validation](#output\_validation) | Validation rules applied | <pre>{<br>  "agent_pool": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "branch_policy_build_validation": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "build_definition": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "elastic_pool": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "environment": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "git_repository": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "git_repository_branch": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "group": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "project": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_argocd": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_artifactory": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_aws": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_azurecr": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_azuredevops": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_azurerm": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_bitbucket": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_dockerregistry": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_externaltfs": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_gcp_terraform": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_generic": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_generic_git": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_github": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_github_enterprise": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_incomingwebhook": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_jenkins": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_jfrog_artifactory_v2": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_jfrog_distribution_v2": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_jfrog_platform_v2": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_jfrog_xray_v2": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_kubernetes": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_maven": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_nexus": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_npm": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_nuget": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_octopusdeploy": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_runpipeline": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_servicefabric": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_sonarcloud": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_sonarqube": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "serviceendpoint_ssh": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "team": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  },<br>  "variable_group": {<br>    "valid_name": true,<br>    "valid_name_unique": true<br>  }<br>}</pre> | no |
| <a name="output_variable_group"></a> [variable\_group](#output\_variable\_group) | Variable Group | <pre>{<br>  "dashes": true,<br>  "max_length": 256,<br>  "min_length": 1,<br>  "name": "testprefix-testsuffix",<br>  "name_unique": "testprefix-testsuffix-h6lf",<br>  "regex": "^[^/\\:*?\"\u003c\u003e|~';.,\\[\\]{}()@#$%^\u0026!+=]*$",<br>  "scope": "Project",<br>  "slug": "advg"<br>}</pre> | no |

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
