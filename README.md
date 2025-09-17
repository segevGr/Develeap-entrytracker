# EntryTracker CI/CD

## Overview

This project implements a complete CI/CD pipeline for the EntryTracker application:

- Python Flask app with MySQL and Nginx (3-tier architecture).
- GitHub Actions pipeline:
  - Build + Unit tests
  - E2E tests with Docker Compose
  - Automatic Docker image tagging and push to Amazon ECR
  - Deployment to Amazon EC2 with Docker Compose
- Extras:
  - **Custom GitHub Actions**:
    - `version-increment` → auto version tagging (located in `.github/actions/version-increment`)
    - `retry` → retry logic for flaky checks (located in `.github/actions/retry`)
  - Email notifications on pipeline status

## Required GitHub Secrets

- `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` – AWS credentials (ECR + EC2 access)
- `ECR_URL` – Your ECR repository URL
- `EC2_HOST`, `EC2_USER`, `EC2_SSH_KEY` – SSH connection details for EC2
- `DB_HOST`, `DB_USER`, `DB_PASSWORD`, `DB_NAME` – MySQL environment variables
- `SMTP_ADDRESS`, `SMTP_PORT`, `SMTP_USER`, `SMTP_PASS` – SMTP configuration for email notifications

## First Run

- A brand-new EC2 instance (Ubuntu) will work out-of-the-box.
- The workflow installs all dependencies automatically (Docker, Docker Compose, AWS CLI, curl).
- Simply push to the `main` branch or trigger the workflow manually → the app will be deployed to EC2.
