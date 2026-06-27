# Terraform - Cloud Resume Challenge Infrastructure

Infrastructure as Code (IaC) for my [Cloud Resume Challenge](https://paul-giff.com) built with Terraform on AWS.

## Architecture

This project defines the complete AWS infrastructure for my serverless resume site using Terraform.

- **S3** — Static site hosting for resume files
- **CloudFront** — CDN with HTTPS enforcement and custom domain
- **Route 53** — DNS records pointing to CloudFront distribution
- **ACM** — SSL/TLS certificate for paul-giff.com
- **Lambda** — Python function handling visitor counter logic
- **DynamoDB** — Serverless database storing visitor count
- **IAM** — Least-privilege roles and policies for Lambda execution

## Live Site

[paul-giff.com](https://paul-giff.com)

## Project Structure

├── main.tf          # Provider and Terraform configuration

├── s3.tf            # S3 bucket and static site configuration

├── cloudfront.tf    # CloudFront distribution and OAC

├── dynamodb.tf      # DynamoDB visitor counter table

├── lambda.tf        # Lambda function and function URL

├── iam.tf           # IAM roles and policies

├── route53.tf       # DNS records

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## Related Projects

- [Cloud Resume Challenge](https://github.com/Paul-Gifford/aws-cloud-resume-challenge) — The full project including frontend and Lambda code