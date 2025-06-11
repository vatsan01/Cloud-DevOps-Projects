End-to-End DevOps Pipeline on AWS with Terraform and EKS

![CI/CD](https://img.shields.io/badge/GitHub%20Actions-Automated-blue?logo=githubactions)
![Terraform](https://img.shields.io/badge/Infrastructure-Terraform-623CE4?logo=terraform)
![Kubernetes](https://img.shields.io/badge/Kubernetes-EKS-326CE5?logo=kubernetes)
![Monitoring](https://img.shields.io/badge/Monitoring-Grafana-orange?logo=grafana)

---

## Project Overview

This project demonstrates a full-scale DevOps pipeline using **AWS EKS**, **Terraform**, **Helm**, and **GitHub Actions**. It provisions infrastructure, deploys a Dockerized app using CI/CD, and integrates real-time monitoring with Prometheus and Grafana.

> Designed to showcase production-grade cloud automation and orchestration skills on AWS.

---

## Architecture Diagram

```text
                 +--------------------+
                 |   GitHub Actions   |
                 +--------+-----------+
                          |
                          v
                 +--------+-----------+
                 |   Terraform (IaC)  |
                 |  AWS VPC + EKS     |
                 +--------+-----------+
                          |
                          v
                 +--------+-----------+
                 |   AWS EKS Cluster  |
                 +--------+-----------+
                          |
          +---------------+---------------+
          |                               |
          v                               v
+------------------+           +---------------------+
| Dockerized App   |           | Prometheus + Grafana|
| (via Helm Chart) |           |    Monitoring Stack |
+------------------+           +---------------------+
```

---

## Tech Stack

| Layer            | Tools/Services                            |
|------------------|-------------------------------------------|
| Infrastructure   | AWS (VPC, IAM, EKS, EC2) + Terraform      |
| CI/CD Pipeline   | GitHub Actions                            |
| Containerization | Docker                                    |
| Orchestration    | Kubernetes via EKS + Helm                 |
| Monitoring       | Prometheus + Grafana                      |

---

## Folder Structure

```text
.
├── terraform/ # EKS, VPC setup using Terraform
├── app/ # Dockerized app (NGINX)
├── helm-charts/ # Helm templates for Kubernetes
├── monitoring/ # Prometheus & Grafana setup
├── .github/workflows/ # GitHub Actions CI/CD
├── README.md
└── architecture.png

yaml
Copy
Edit
```
---

## Features Implemented

- **Infrastructure as Code** (Terraform for AWS VPC + EKS)
- **CI/CD pipeline** with GitHub Actions triggered on push
- **Helm-based deployment** for reproducible Kubernetes releases
- **Scalable EKS node group** with autoscaling
- **Dockerized app** exposed via Kubernetes LoadBalancer
- **Monitoring stack** using Prometheus and Grafana dashboards

---

## Getting Started

### Prerequisites

- AWS CLI configured
- Terraform installed
- Docker installed
- GitHub + DockerHub accounts
- `kubectl` & `helm` installed

---

### Setup Steps

#### 1. Clone the repository
```bash
git clone https://github.com/vatsan01/Cloud-DevOps-Projects.git
cd "End-to-End DevOps Pipeline on AWS with Terraform and EKS"
```

2. Provision EKS + VPC with Terraform
```bash
Copy
Edit
cd terraform
terraform init
terraform apply
Update backend settings if using S3 for state.
```

3. Build & Push the Dockerized App
```bash
Copy
Edit
cd ../app
docker build -t your-dockerhub-username/myapp .
docker push your-dockerhub-username/myapp
Update values.yaml with this image name.
```

4. Deploy to EKS using Helm
```bash
Copy
Edit
cd ../helm-charts
helm upgrade --install myapp ./myapp -n dev --create-namespace
```

5. Set Up Monitoring
```bash
Copy
Edit
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install monitoring prometheus-community/kube-prometheus-stack -f ../monitoring/prometheus-config.yaml
Access the App & Monitoring
```

Get LoadBalancer URL:
```bash
Copy
Edit
kubectl get svc -n dev
```

Access Grafana:
```bash
Copy
Edit
kubectl get svc -n default
Default credentials:

Username: admin

Password: admin (or set via values)
```

Why This Project Matters
This project aligns with real-world AWS DevOps roles requiring:

Cloud-native CI/CD pipelines

Kubernetes orchestration

Infrastructure automation (IaC)

Observability and reliability at scale

Author
Srivatsan Ganesh
DevOps & Cloud Engineer | https://www.linkedin.com/in/srivatsan-g/


License
This project is licensed under the MIT License# End-to-End DevOps Pipeline on AWS
