resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet[0].id

  user_data = <<-EOF
              #!/bin/bash
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Welcome to Highly Available Web App!</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "web-instance"
  }
}
