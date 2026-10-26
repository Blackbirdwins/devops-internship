# AWS Mapping — On-Prem to AWS

**Intern:** Muhammad Anas
**Date:** 26 Oct 2026

## Mapping Table

| On-Prem Component | AWS Equivalent | Kya Karta Hai |
|-------------------|----------------|---------------|
| Laptop / VM | **EC2** | Virtual server |
| Local Disk | **EBS** | Block storage |
| MySQL (local) | **RDS** | Managed database |
| Redis (local) | **ElastiCache** | Managed cache |
| Nginx (reverse proxy) | **ALB** | Application Load Balancer |
| Static IP (192.168.29.141) | **Elastic IP** | Static public IP |
| DNS (local) | **Route 53** | DNS service |
| Firewall (ufw/iptables) | **Security Groups** | Instance-level firewall |
| Network (192.168.29.0/24) | **VPC** | Virtual private cloud |
| Subnets | **Subnets** | Network segmentation |
| Systemd (service management) | **ECS / EKS** | Container orchestration |
| Jenkins | **CodePipeline / CodeBuild** | CI/CD |
| Prometheus | **CloudWatch** | Metrics & monitoring |
| Grafana | **CloudWatch Dashboards** | Visualization |
| SSL cert (self-signed) | **ACM** | Free SSL certs |
| Secrets (env vars) | **Secrets Manager** | Secure secret storage |
| Backups (mysqldump) | **RDS Snapshots** | Automated backups |
| Docker | **ECS Fargate** | Serverless containers |
| Kubernetes | **EKS** | Managed K8s |

## Architecture on AWS
User
↓
Route 53 (DNS)
↓
ALB (Application Load Balancer)
↓
├── EC2 Instance 1 (App)
└── EC2 Instance 2 (App)
↓
├── RDS (MySQL)
├── ElastiCache (Redis)
└── CloudWatch (Monitoring)

text

## Key Differences (On-Prem vs AWS)

| Feature | On-Prem | AWS |
|---------|---------|-----|
| Setup time | Hours/days | Minutes |
| Scaling | Manual | Auto-scaling |
| Maintenance | You manage | AWS manages (RDS, EKS) |
| Cost | Fixed | Pay-as-you-go |
| HA | Manual (Keepalived) | Multi-AZ (built-in) |
| Backup | Manual (mysqldump) | Automated (RDS snapshots) |
