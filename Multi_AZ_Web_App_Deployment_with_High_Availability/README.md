# Multi AZ Web App Deployment with High Availability

This project deploys a production-grade web application on AWS using:

- ✅ Custom VPC
- ✅ Multi-AZ Auto Scaling
- ✅ Application Load Balancer (ALB)
- ✅ RDS with failover
- ✅ IAM for access control
- ✅ CloudTrail for auditing
- ✅ Infrastructure-as-Code using Terraform

## 🛠 Technologies Used
- Terraform
- AWS (EC2, RDS, ALB, IAM, VPC, CloudTrail)

## 🚀 How to Run

```bash
cd terraform
terraform init
terraform apply
```

Make sure to set `ami_id` as a variable during apply.
