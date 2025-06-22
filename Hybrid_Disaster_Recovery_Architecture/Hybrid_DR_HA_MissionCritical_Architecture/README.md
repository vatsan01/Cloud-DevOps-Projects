# Hybrid Disaster Recovery & High Availability (HA) Architecture

This project demonstrates the implementation of a Hybrid Cloud Disaster Recovery and High Availability Architecture using AWS, Terraform, Lambda, and monitoring tools like Prometheus & Grafana. It focuses on automating failover, replication, and backup in a mission-critical environment.

---

## Features

- Multi-AZ EC2 & RDS deployment
- S3 cross-region replication
- Automated backup with AWS Lambda
- Disaster recovery (DR) simulation using scripts
- Infrastructure-as-Code with Terraform
- Monitoring via Prometheus & Grafana
- Optional GuardDuty, AWS Config, and SCP integrations

---

## STEP 1: Setup and Prerequisites

### Install Locally

Make sure the following tools are installed on your local machine:

- AWS CLI
- Terraform
- Git
- kubectl
- Docker (Optional for local Prometheus & Grafana)
- Prometheus & Grafana (Optional)

### AWS Setup

- Create an IAM user with AdministratorAccess or use a role.
- Configure AWS credentials:

```bash
aws configure
```

---

## STEP 2: Clone the Repository

```bash
git clone https://github.com/vatsan01/Cloud-DevOps-Projects.git
cd Cloud-DevOps-Projects/Hybrid_Disaster_Recovery_Architecture
```

---

## STEP 3: Deploy Infrastructure with Terraform

Navigate to the production Terraform environment:

```bash
cd terraform/prod
terraform init
terraform plan
terraform apply -auto-approve
```

### This deploys:

- VPC with public subnets
- Auto Scaling EC2 instances
- Multi-AZ RDS database
- S3 buckets and IAM roles

---

## STEP 4: Setup S3 Cross-Region Replication

In AWS Console:

- Enable versioning on both source and destination S3 buckets.
- Set up replication rules in the source bucket.
- Configure IAM permissions for replication.
- Refer: https://docs.aws.amazon.com/AmazonS3/latest/userguide/replication.html

---

## STEP 5: Automate Backup with Lambda

1. Go to AWS Lambda → Create Function → Author from Scratch  
2. Runtime: Python 3.11  
3. Paste the script from /scripts/backup-lambda.py  
4. Attach the AWSBackupOperatorAccess permission  
5. Test with sample input  
6. (Optional) Add a CloudWatch scheduled trigger

---

## STEP 6: Setup Prometheus & Grafana Monitoring

### Option A: Run Locally

```bash
docker run -d -p 9090:9090 prom/prometheus
docker run -d -p 3000:3000 grafana/grafana
```

### Option B: Run on EKS (Advanced)

- Deploy Prometheus and Grafana to EKS
- Import dashboards from /monitoring/grafana-dashboards/dashboard.json

---

## STEP 7: Simulate Disaster Recovery (Failover)

Run a failover simulation script:

```bash
cd ../../scripts
chmod +x failover-test.sh
./failover-test.sh
```

### This will:

- Stop an EC2 instance in one AZ
- ASG will launch a replacement in another AZ
- Load balancer will redirect traffic

#### Verify using:

```bash
aws autoscaling describe-auto-scaling-instances
aws elbv2 describe-target-health --target-group-arn <your-arn>
```

---

## STEP 8: Optional Advanced Security

- AWS Config → Enable rules to track compliance
- GuardDuty → Enable for threat detection
- AWS Organizations & SCPs → Set service control policies

---

## STEP 9: Validation Checklist

- [x] EC2 and RDS are in Multi-AZ setup  
- [x] S3 cross-region replication is functioning  
- [x] Lambda backup script works as intended  
- [x] DR failover simulation successful  
- [x] Prometheus + Grafana monitoring in place  

---

## STEP 10: Final Documentation

- Upload AWS console screenshots of infrastructure  
- Add DR test logs and Lambda test results  
- Capture a 1-min walkthrough using Loom or OBS  
- Include Prometheus dashboards

---

## Project Structure

```
├── architecture/            # Architecture diagrams and references
├── automation/              # CI/CD or automation scripts
├── monitoring/              # Grafana dashboards, Prometheus configs
├── scripts/                 # DR failover scripts, backup Lambda
├── terraform/               # IaC for infrastructure
│   └── prod/                # Production environment definitions
└── README.md                # Project overview and instructions
```

---

## Need Help?

Feel free to raise an issue or contact the maintainer for help with:

- Prometheus on EKS
- Real AWS Terraform setup
- Lambda via CloudWatch triggers
- AWS Secrets Manager/Parameter Store integration

---

## Author

Srivatsan G  
Cloud & DevOps Enthusiast | GitHub: https://github.com/vatsan01
