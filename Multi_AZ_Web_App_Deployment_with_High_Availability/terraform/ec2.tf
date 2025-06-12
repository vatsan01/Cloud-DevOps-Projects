resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet[0].id
  user_data     = file("app/index.html")

  tags = {
    Name = "web-instance"
  }
}
