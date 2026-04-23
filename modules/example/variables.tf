variable "bucket_name" {
  description = "Name of the bucket created by the module"
  type        = string
}

variable "environment" {
  description = "Environment for tag metadata"
  type        = string
}

variable "tags" {
  description = "Additional tags to apply"
  type        = map(string)
  default     = {}
}
