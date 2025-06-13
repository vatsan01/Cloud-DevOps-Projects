resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.lb_sg.id]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet[0].id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  key_name                    = "devops-key"  # Replace with your actual key pair name

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo '<h1>Welcome to Highly Available Web App!</h1>' > /var/www/html/index.html
  EOF

  tags = {
    Name = "web-instance"
  }
}
