# EC2 Instance Terraform Configuration

This directory contains Terraform code to create and manage AWS EC2 instances.

## Files Overview

- **main.tf**: Main EC2 resource definitions (instance, security group, Elastic IP)
- **variables.tf**: Input variables for customizing the EC2 instance
- **outputs.tf**: Output values after instance creation
- **terraform.tfvars**: Example configuration values

## Prerequisites

1. AWS Account and AWS CLI configured
2. Terraform installed (v1.0+)
3. EC2 Key Pair created in your AWS region

## Quick Start

### 1. Configure Variables

Edit `terraform.tfvars` and update:
- `key_pair_name`: Name of your EC2 key pair
- `instance_type`: Instance type (t2.micro, t2.small, etc.)
- `allowed_ssh_cidr`: Restrict SSH access to your IP for security
- `user_data`: Optional scripts to run on instance launch

### 2. Initialize Terraform

```bash
cd Resources/EC2
terraform init
```

### 3. Plan the Deployment

```bash
terraform plan
```

### 4. Apply the Configuration

```bash
terraform apply
```

### 5. Get Outputs

After creation, retrieve instance details:

```bash
terraform output
terraform output instance_public_ip
terraform output instance_id
```

## Common Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `instance_name` | Name of EC2 instance | my-app-instance |
| `instance_type` | Instance type | t2.micro |
| `key_pair_name` | EC2 key pair name | (required) |
| `root_volume_size` | Root volume size in GB | 20 |
| `environment` | Environment name | dev |
| `create_eip` | Create Elastic IP | false |

## SSH Access

Once the instance is created:

```bash
ssh -i /path/to/key-pair.pem ubuntu@<instance_public_ip>
```

## Cleanup

To destroy all resources:

```bash
terraform destroy
```

## Security Best Practices

1. **Restrict SSH Access**: Change `allowed_ssh_cidr` from `0.0.0.0/0` to your IP
2. **Use Key Pairs**: Never use password-based SSH access
3. **Security Groups**: Limit ingress rules to necessary ports
4. **Monitoring**: Enable CloudWatch monitoring in production

## Additional Resources

- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
