provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../modules/vpc"
}

# Other modules like ec2, rds would follow here
