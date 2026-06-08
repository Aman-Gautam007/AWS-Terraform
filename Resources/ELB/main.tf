# Application Load Balancer with EC2 Configuration
# This configuration creates a VPC, EC2 instances, and an ALB
# 
# Files:
# - versions.tf: Terraform and provider requirements
# - providers.tf: AWS provider configuration
# - variables.tf: Input variables
# - data.tf: Data sources (AMI, AZs)
# - network.tf: VPC, subnets, internet gateway, route tables
# - security_groups.tf: ALB and instance security groups
# - compute.tf: EC2 instances
# - load_balancer.tf: ALB, target groups, listeners
# - outputs.tf: Output values
#
# This file serves as documentation. See individual .tf files for resource definitions.