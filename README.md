# AWS Terraform

Basic Terraform scaffold for creating AWS resources.

## Structure

- `main.tf` — core resource definitions
- `providers.tf` — provider configuration
- `variables.tf` — input variables
- `outputs.tf` — output values
- `terraform.tfvars` — local variable values
- `versions.tf` — required Terraform and provider versions
- `modules/` — reusable Terraform modules
- `envs/` — environment-specific variable files

## Usage

1. Install Terraform.
2. Initialize:
   ```bash
   terraform init
   ```
3. Validate:
   ```bash
   terraform validate
   ```
4. Plan:
   ```bash
   terraform plan -var-file="envs/dev.tfvars"
   ```
5. Apply:
   ```bash
   terraform apply -var-file="envs/dev.tfvars"
   ```
