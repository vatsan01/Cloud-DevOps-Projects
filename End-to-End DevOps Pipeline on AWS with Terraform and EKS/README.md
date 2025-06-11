
# End-to-End DevOps Pipeline on AWS with Terraform and EKS

This project demonstrates a complete DevOps workflow using AWS, Terraform, Kubernetes (EKS), and GitHub Actions for CI/CD.

## Project Overview

- **Infrastructure as Code**: Provisioned using Terraform
- **Orchestration**: Kubernetes running on AWS EKS
- **CI/CD**: Automated using GitHub Actions
- **Application**: A sample NGINX deployment and service

## Project Structure

```
.
├── terraform/                # Contains IaC scripts for AWS resources
│   └── main.tf
├── k8s-manifests/            # Kubernetes manifests for deployment
│   ├── deployment.yaml
│   └── service.yaml
└── .github/workflows/        # CI/CD workflow definition
    └── deploy.yml
```

## Setup Instructions

1. **Provision Infrastructure**
   - Navigate to the `terraform/` directory.
   - Run:
     ```
     terraform init
     terraform apply
     ```

2. **Deploy Application**
   - Ensure `kubectl` is configured to access EKS.
   - Apply manifests:
     ```
     kubectl apply -f k8s-manifests/
     ```

3. **Automated Deployment**
   - GitHub Actions handles CI/CD. On push to `main`, changes are deployed automatically.

## Future Enhancements

- Add Prometheus & Grafana for monitoring.
- Integrate Helm for better deployment management.
- Add Terraform modules and variables for production-grade setup.
