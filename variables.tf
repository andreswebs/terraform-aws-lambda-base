variable "lambda_name" {
  type        = string
  description = "Lambda name"
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
