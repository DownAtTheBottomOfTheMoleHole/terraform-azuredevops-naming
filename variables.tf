variable "environment_tags" {
  type        = list(string)
  description = "List of environment names in their shortened form. These will be translated to full names in the module."
  default     = ["dev", "uat", "prd"]
  validation {
    condition     = alltrue([for tag in var.environment_tags : can(regex("^(acc|aud|com|dev|eph|fet|hot|int|pen|per|prd|prod|reg|stg|sys|tst|uat)$", tag))])
    error_message = "The environment_tags must be one of the following: acc, aud, com, dev, eph, fet, hot, int, pen, per, prd, prod, reg, stg, sys, tst, uat."
  }
}

variable "prefix" {
  type        = list(string)
  description = "Prefix to be used for naming resources. If used we suggest using a company abbreviation e.g dbmh."
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
  description = "List of Work Items or issue numbers to be used in branch name and environment name creation. For example, ['1234', '1235'] will create branch names like 'feature/1234-' and 'feature/1235-'."
  default     = []
}

variable "area_paths" {
  type        = list(string)
  description = "Optional list of area path names to generate naming for. Used by the area_path resource."
  default     = []
}

variable "iteration_paths" {
  type        = list(string)
  description = "Optional list of iteration path names to generate naming for. Used by the iteration_path resource."
  default     = []
}

variable "dashboards" {
  type        = list(string)
  description = "Optional list of dashboard names to generate naming for. Used by the dashboard resource."
  default     = []
}

variable "feeds" {
  type        = list(string)
  description = "Optional list of artifact feed names to generate naming for. Used by the feed resource."
  default     = []
}

variable "wiki_pages" {
  type        = list(string)
  description = "Optional list of wiki page names to generate naming for. Used by the wiki_page resource."
  default     = []
}

variable "pipeline_stages" {
  type        = list(string)
  description = "Optional list of pipeline stage names to generate naming for. Used by the pipeline_stage resource."
  default     = []
}

variable "pipeline_jobs" {
  type        = list(string)
  description = "Optional list of pipeline job names to generate naming for. Used by the pipeline_job resource."
  default     = []
}

variable "pipeline_variables" {
  type        = list(string)
  description = "Optional list of pipeline variable names to generate naming for. Used by the pipeline_variable resource."
  default     = []
}
