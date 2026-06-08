# EC2 Instances
resource "aws_instance" "web" {
  count                       = var.instance_count
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public[count.index].id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.instance.id]

  user_data = <<-EOT
    #!/bin/bash
    yum update -y
    yum install -y nginx
    systemctl enable nginx
    systemctl start nginx
    echo "Hello from web instance ${count.index + 1}" > /usr/share/nginx/html/index.html
  EOT

  tags = {
    Name = "web-${count.index + 1}"
  }
}
