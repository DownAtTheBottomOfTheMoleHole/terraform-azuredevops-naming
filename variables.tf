# Purpose: Define the variables that will be used in the module

variable "prefix" {
  default     = []
  description = "It is not recommended that you use prefix by azure you should be using a suffix for your resources."
  nullable    = false
  sensitive   = false
  type        = list(string)
}

variable "suffix" {
  default     = []
  description = "It is recommended that you specify a suffix for consistency. please use only lowercase characters when possible"
  nullable    = false
  sensitive   = false
  type        = list(string)
}

variable "unique_seed" {
  default     = ""
  description = "Custom value for the random characters to be used"
  nullable    = false
  sensitive   = false
  type        = string
}

variable "unique_length" {
  default     = 4
  description = "Max length of the uniqueness suffix to be added"
  nullable    = false
  sensitive   = false
  type        = number
}

variable "unique_include_numbers" {
  default     = true
  description = "If you want to include numbers in the unique generation"
  nullable    = false
  sensitive   = false
  type        = bool
}


