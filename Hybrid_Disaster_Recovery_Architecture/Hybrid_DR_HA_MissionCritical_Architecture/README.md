# Hybrid Disaster Recovery & High Availability Architecture

## Overview
A production-grade cloud infrastructure project built with AWS and Terraform, featuring cross-region S3 replication, multi-AZ deployment, and automated DR.

## Features
- Multi-AZ EC2 & RDS
- S3 replication & AWS Backup
- Terraform IaC
- CI/CD with GitHub Actions
- Real-time alerting with Prometheus/Grafana
- Lambda-triggered backup

## Getting Started
1. Configure AWS credentials.
2. Edit `terraform/prod/` with your environment settings.
3. Run GitHub Actions or manually apply Terraform:
```bash
cd terraform/prod
terraform init
terraform apply
```
4. Deploy Lambda using `scripts/backup-lambda.py`
5. Simulate failover with `scripts/failover-test.sh`

## Diagram
See `architecture/dr_architecture_diagram.png`

## License
For learning and demonstration purposes only.
