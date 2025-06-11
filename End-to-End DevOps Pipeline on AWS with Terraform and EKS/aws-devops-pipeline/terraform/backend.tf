terraform {
  backend "s3" {
    bucket = "your-s3-bucket"
    key = "eks/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt = true
  }
}