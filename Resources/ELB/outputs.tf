output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.app.dns_name
}

output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.app.arn
}

output "web_instance_ids" {
  description = "IDs of the web instances"
  value       = aws_instance.web.*.id
}

output "web_instance_ips" {
  description = "Public IPs of the web instances"
  value       = aws_instance.web.*.public_ip
}
