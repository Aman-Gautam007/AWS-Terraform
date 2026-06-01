# EC2 Instance Resource Configuration

# Security Group for EC2
resource "aws_security_group" "ec2_sg" {
  name        = "${var.instance_name}-sg"
  description = "Security group for ${var.instance_name}"

  # SSH access
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr
  }

  # HTTP access
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS access
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.instance_name}-sg"
    Environment = var.environment
  }
}

# Data source to get latest Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical (Ubuntu)

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# EC2 Instance
resource "aws_instance" "main" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  # Root volume configuration
  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.root_volume_size
    delete_on_termination = true

    tags = {
      Name = "${var.instance_name}-root-volume"
    }
  }

  # User data script
  user_data = base64encode(var.user_data)

  # Enable monitoring
  monitoring = var.enable_monitoring

  tags = {
    Name        = var.instance_name
    Environment = var.environment
  }

  depends_on = [aws_security_group.ec2_sg]
}

# Elastic IP (optional)
resource "aws_eip" "main" {
  count    = var.create_eip ? 1 : 0
  instance = aws_instance.main.id
  domain   = "vpc"

  tags = {
    Name        = "${var.instance_name}-eip"
    Environment = var.environment
  }

  depends_on = [aws_instance.main]
}
