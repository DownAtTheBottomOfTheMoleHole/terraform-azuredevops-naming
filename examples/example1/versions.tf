terraform {
  required_version = ">= 1.14.0, < 2.0.0"

  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 1.16.0, < 2.0.0"
    }
  }
}
