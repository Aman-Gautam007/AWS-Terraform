variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "my-app-instance"
}

variable "instance_type" {
  description = "EC2 instance type (e.g., t2.micro, t2.small, t3.medium)"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair for SSH access"
  type        = string
}

variable "root_volume_size" {
  description = "Size of the root EBS volume in GB"
  type        = number
  default     = 20
}

variable "allowed_ssh_cidr" {
  description = "CIDR blocks allowed for SSH access. Change from 0.0.0.0/0 for security"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "user_data" {
  description = "User data script to execute on instance launch"
  type        = string
  default     = "#!/bin/bash\necho 'Welcome to EC2 instance!'"
}

variable "environment" {
  description = "Environment name (dev, staging, prod, etc.)"
  type        = string
  default     = "dev"
}

variable "create_eip" {
  description = "Whether to create an Elastic IP for the instance"
  type        = bool
  default     = false
}

variable "enable_monitoring" {
  description = "Enable CloudWatch detailed monitoring"
  type        = bool
  default     = false
}
