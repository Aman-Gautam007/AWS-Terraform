provider "aws" {
    region = var.region
}

variable "region" {
    description = "AWS region for resources"
    type        = string
    default     = "us-east-1"
}

# Create the CloudShell service-linked role (cloudshell.amazonaws.com)
resource "aws_iam_service_linked_role" "cloudshell" {
    aws_service_name = "cloudshell.amazonaws.com"
    description      = "Service-linked role for AWS CloudShell created by Terraform"
    # custom_suffix is optional; remove if you don't want it:
    custom_suffix = "tf"
}

output "cloudshell_service_linked_role_arn" {
    description = "ARN of the CloudShell service-linked role"
    value       = aws_iam_service_linked_role.cloudshell.arn
}