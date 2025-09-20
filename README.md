# EntryTracker CI/CD

## Overview

Complete CI/CD pipeline for EntryTracker:

- Flask + MySQL + Nginx (3-tier)
- GitHub Actions:
  - Build + Unit tests
  - E2E tests with Docker Compose
  - Push Docker image to Amazon ECR
  - Deploy to EC2 with Docker Compose
- Extras:
  - Custom Actions (`version-increment`, `retry`)
  - Email notifications

## Required Secrets

| Secret                                                | Purpose                     |
| ----------------------------------------------------- | --------------------------- |
| `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`          | AWS credentials (ECR + EC2) |
| `ECR_URL`                                             | Amazon ECR repository URL   |
| `EC2_HOST`, `EC2_USER`, `EC2_SSH_KEY`                 | EC2 SSH connection details  |
| `DB_HOST`, `DB_USER`, `DB_PASSWORD`, `DB_NAME`        | MySQL configuration         |
| `SMTP_ADDRESS`, `SMTP_PORT`, `SMTP_USER`, `SMTP_PASS` | SMTP for notifications      |

## Setup Notes ⚠️

This will **not work out-of-the-box**. You must:

1. **Create a new EC2 instance**

   - Open **ports 22 (SSH)** and **80 (HTTP)** in the security group
   - Create your own **SSH key pair** and set `EC2_SSH_KEY`
   - Attach an **IAM role** with `AmazonEC2ContainerRegistryReadOnly` policy

2. **Update GitHub Secrets**

   - Replace all EC2, DB, ECR and SMTP secrets with your own values

3. **Configure Email**
   - This project uses [Ethereal Email](https://ethereal.email/) (test SMTP)
   - Generate new credentials and set `SMTP_*` secrets

Once the environment is ready → push to `main` or manually trigger the workflow.
