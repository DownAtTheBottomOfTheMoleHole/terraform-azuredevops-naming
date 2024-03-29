variable "environment_tags" {
  type        = list(string)
  description = "List of environment names in their shortened form. These will be translated to full names in the module."
  default     = ["dev", "uat", "prd"]
  validation {
    condition     = alltrue([for tag in var.environment_tags : can(regex("^(acc|aud|com|dev|eph|fet|hot|int|pen|per|prd|reg|stg|sys|tst|uat)$", tag))])
    error_message = "The environment_tags must be one of the following: acc, aud, com, dev, eph, fet, hot, int, pen, per, prd, reg, stg, sys, tst, uat."
  }
}

variable "prefix" {
  type        = list(string)
  description = "Prefix to be used for naming resources. Azure recommends using a suffix instead for consistency."
  default     = []
}

variable "suffix" {
  type        = list(string)
  description = "Suffix to be used for naming resources. It is recommended to use lowercase characters for consistency."
  default     = []
}

variable "unique_seed" {
  type        = string
  description = "Custom seed value for generating unique random characters."
  default     = ""
}

variable "unique_length" {
  type        = number
  description = "Maximum length of the unique suffix to be added to resource names."
  default     = 4
  validation {
    condition     = var.unique_length >= 0
    error_message = "The unique_length must be greater than or equal to 0."
  }
}

variable "unique_include_numbers" {
  type        = bool
  description = "Determines whether numbers should be included in the unique suffix generation."
  default     = true
}

variable "work_items" {
  type        = list(string)
  description = "List of Work Items or issue numbers to be used in branch name creation. For example, ['1234', '1235'] will create branch names like 'feature/1234-' and 'feature/1235-'."
  default     = []
}