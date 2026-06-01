output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.main.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.main.public_ip
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.main.private_ip
}

output "instance_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.main.public_dns
}

output "security_group_id" {
  description = "The ID of the security group attached to the instance"
  value       = aws_security_group.ec2_sg.id
}

output "security_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.ec2_sg.name
}

output "ami_id" {
  description = "The AMI ID used for the EC2 instance"
  value       = data.aws_ami.ubuntu.id
}

output "eip_address" {
  description = "The Elastic IP address (if created)"
  value       = var.create_eip ? aws_eip.main[0].public_ip : null
}

output "eip_id" {
  description = "The Elastic IP allocation ID (if created)"
  value       = var.create_eip ? aws_eip.main[0].id : null
}
