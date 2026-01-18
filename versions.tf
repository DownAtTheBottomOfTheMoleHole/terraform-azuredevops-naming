terraform {
  required_version = ">= 1.14.0, < 2.0.0"
  required_providers {

    random = {
      source  = "hashicorp/random"
      version = ">= 3.8.0, < 4.0.0"
    }
  }
}
