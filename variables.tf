variable "name" {
  type        = string
  description = "Generic service name, used to name module resources"
}

variable "log_group_prefix" {
  type        = string
  description = "The log group prefix"
  default     = "/aws/lambda"
}

variable "log_retention_in_days" {
  type        = number
  description = "The number of days to retain the log events in the log group"
  default     = 30
}

variable "service" {
  type        = string
  description = "The service principal for the role. Can be 'lambda' or 'states'"
  default     = "lambda"
  validation {
    condition     = var.service == "lambda" || var.service == "states"
    error_message = "Service must be either `lambda` or `states`"
  }
}

variable "vpc_permissions_enabled" {
  type        = bool
  description = "(Optional) Whether to enable VPC permissions for the execution role"
  default     = false
}
