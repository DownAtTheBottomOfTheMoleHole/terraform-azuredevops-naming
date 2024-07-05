terraform {
  required_version = "~> 1.9.1" # pinned due to breaking changes occurring in minor updates
  required_providers {

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.2" # pinned due to breaking changes occurring in minor updates
    }

  }
}

