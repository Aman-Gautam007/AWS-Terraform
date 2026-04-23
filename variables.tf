variable "environment" {
  description = "Deployment environment name"
  type        = string
  default     = "dev"
}

variable "bucket_name" {
  description = "Name of the S3 bucket to create"
  type        = string
}
