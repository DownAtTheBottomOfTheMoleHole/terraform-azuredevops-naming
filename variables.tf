variable "environment_tags" {
  type        = list(string)
  description = "List of environment names in their shortened form. These will be translated to full names in the module."
  default     = ["dev", "uat", "prd"]
  nullable    = false
  validation {
    condition     = alltrue([for tag in var.environment_tags : can(regex("^(acc|aud|com|dev|eph|fet|hot|int|pen|per|prd|prod|reg|stg|sys|tst|uat)$", tag))])
    error_message = "The environment_tags must be one of the following: acc, aud, com, dev, eph, fet, hot, int, pen, per, prd, prod, reg, stg, sys, tst, uat."
  }
}

variable "prefix" {
  type        = list(string)
  description = "Prefix to be used for naming resources. If used we suggest using a company abbreviation e.g dbmh."
  default     = []
  nullable    = false
}

variable "suffix" {
  type        = list(string)
  description = "Suffix to be used for naming resources. It is recommended to use lowercase characters for consistency."
  default     = []
  nullable    = false
}

variable "unique_seed" {
  type        = string
  description = "Optional deterministic value used as the source of the unique suffix. When empty, the module generates a random value; only the first unique_length characters are appended to names."
  default     = ""
  nullable    = false
}

variable "unique_length" {
  type        = number
  description = "Maximum length of the unique suffix to be added to resource names."
  default     = 4
  nullable    = false
  validation {
    condition     = var.unique_length >= 0 && var.unique_length == floor(var.unique_length)
    error_message = "The unique_length must be a whole number greater than or equal to 0."
  }
}

variable "unique_include_numbers" {
  type        = bool
  description = "Determines whether numbers should be included in the unique suffix generation."
  default     = true
  nullable    = false
}

variable "work_items" {
  type        = list(string)
  description = "List of work item or issue identifiers used to key branch-name and work-item environment outputs. For example, ['1234', '1235'] creates entries such as 'feature/1234' and 'feature/1235' before any prefix, suffix, or unique value is added."
  default     = []
  nullable    = false
}

variable "area_paths" {
  type        = list(string)
  description = "Reserved for future per-area-path naming. This input is accepted but does not affect outputs in the current release."
  default     = []
}

variable "iteration_paths" {
  type        = list(string)
  description = "Reserved for future per-iteration-path naming. This input is accepted but does not affect outputs in the current release."
  default     = []
}

variable "dashboards" {
  type        = list(string)
  description = "Reserved for future per-dashboard naming. This input is accepted but does not affect outputs in the current release."
  default     = []
}

variable "feeds" {
  type        = list(string)
  description = "Reserved for future per-feed naming. This input is accepted but does not affect outputs in the current release."
  default     = []
}

variable "wiki_pages" {
  type        = list(string)
  description = "Reserved for future per-wiki-page naming. This input is accepted but does not affect outputs in the current release."
  default     = []
}

variable "pipeline_stages" {
  type        = list(string)
  description = "Reserved for future per-pipeline-stage naming. This input is accepted but does not affect outputs in the current release."
  default     = []
}

variable "pipeline_jobs" {
  type        = list(string)
  description = "Reserved for future per-pipeline-job naming. This input is accepted but does not affect outputs in the current release."
  default     = []
}

variable "pipeline_variables" {
  type        = list(string)
  description = "Reserved for future per-pipeline-variable naming. This input is accepted but does not affect outputs in the current release."
  default     = []
}
