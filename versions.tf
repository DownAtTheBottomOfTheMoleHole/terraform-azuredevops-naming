terraform {
  required_version = "~> 1.8.0" # pinned due to breaking changes occurring in minor updates
  required_providers {

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.0" # pinned due to breaking changes occurring in minor updates
    }

  }
}
