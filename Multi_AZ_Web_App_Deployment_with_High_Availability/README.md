# Multi-AZ Web App Deployment with High Availability

## Project Description

This project demonstrates how to deploy a **highly available**, production-ready web application on AWS using **Terraform**. The deployment includes:

- A custom **VPC** with public subnets across **multiple availability zones**
- An **EC2 instance** running Apache (httpd) as the web server
- An **Application Load Balancer (ALB)** for high availability and traffic distribution
- An **RDS instance** (optional in this simplified version)
- Proper **IAM roles** for EC2 and services
- **CloudTrail** logging enabled for compliance
- All infrastructure as code using **Terraform**

---

## Architecture

```
User ---> ALB ---> EC2 instance (Apache) ---> index.html
        |
        +--> Multi-AZ subnets
        |
        +--> RDS (Optional)
```

---

## Technologies Used

- AWS (EC2, ALB, VPC, IAM, CloudTrail, RDS)
- Terraform (v1.6+)
- Amazon Linux 2
- Apache (httpd)

---

## Project Structure

```
Multi_AZ_Web_App_Deployment_with_High_Availability/
├── terraform/
│   ├── provider.tf
│   ├── vpc.tf
│   ├── ec2.tf
│   ├── alb.tf
│   ├── rds.tf
│   ├── iam.tf
│   ├── cloudtrail.tf
│   ├── variables.tf
│   └── outputs.tf
└── app/
    └── index.html
```

---

## How to Deploy

### Step 1: Clone the Repo
```bash
git clone https://github.com/your-username/Cloud-DevOps-Projects.git
cd Cloud-DevOps-Projects/Multi_AZ_Web_App_Deployment_with_High_Availability/terraform
```

### Step 2: Initialize Terraform
```bash
terraform init
```

### Step 3: Preview and Apply
```bash
terraform plan -out=tfplan
terraform apply tfplan
```

### Step 4: Output

After successful deployment, Terraform will show:
```
Outputs:
alb_dns_name = "app-lb-xxxxxxxxx.us-east-1.elb.amazonaws.com"
```

Visit this URL in your browser to see the running web app.

---

## Post-Deployment Checks

1. **ALB Target Health Check** → Should be `Healthy`
2. **Browser Check** → Visit ALB DNS
3. **SSH into EC2 (optional)**:
   ```bash
   ssh -i <your-key.pem> ec2-user@<Public-IP>
   ```

---

## To Destroy the Infrastructure

```bash
terraform destroy -auto-approve
```

---

## Final Output

```
<h1>Welcome to Highly Available Web App!</h1>
```

---

## Author

Srivatsan Ganesh  
Cloud DevOps | AWS | Terraform | Python
