resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2 AMI
  instance_type = "t3.micro"
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  tags = {
    Name = "web-server"
  }
}
