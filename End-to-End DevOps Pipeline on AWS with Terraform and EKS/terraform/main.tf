
# Terraform configuration for AWS EKS cluster
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main-vpc"
  }
}

# (Add EKS, Subnets, IAM roles, etc. here)
