# Cloud Event-Driven Infrastructure

This repository contains the Terraform and Lambda scaffolding for an AWS event-driven cloud architecture.

## Architecture overview

- CloudTrail: captures AWS API calls
- EventBridge: routes events by rule
- SQS: decouples event processing
- Lambda: processes each event type
- SNS: delivers alert notifications
- API Gateway: exposes query APIs
- RDS PostgreSQL: stores event metadata and state
- ElastiCache: caches real-time feed data
- S3: archives raw event payloads and Terraform state
- EKS: hosts the dashboard
- WAF: protects API Gateway
- Shield: DDoS protection
- Route 53: DNS and custom domain
- GuardDuty: feeds threat detection events
- VPC: network isolation
- KMS: encrypts everything at rest
- CloudWatch: collects Lambda logs and metrics

## Structure

- `terraform/`: Terraform root module and environment configuration
- `terraform/modules/`: reusable infrastructure modules
- `lambdas/`: Lambda function source code and dependencies

## Next steps

1. Complete the new Terraform modules in `terraform/modules/`
2. Configure AWS provider, backend, and variables
3. Deploy infrastructure with `terraform init` / `plan` / `apply`
4. Package and deploy Lambda functions
5. Wire EventBridge rules, SQS queues, SNS topics, and API Gateway
