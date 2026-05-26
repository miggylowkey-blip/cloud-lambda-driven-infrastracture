terraform {
  required_version = ">= 1.5"

  required_providers {
    archive = {
      source = "hashicorp/archive"
      version = "2.4.2"
    }


    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }

  backend "s3" {
    bucket = "security-processor"
    key    = "Cloud-Event-Driven-Infrastracture/terraform.tfstate"
    region = "ap-southeast-2"
    DynamoDB_table = "terraform-lock-table"
    encrypt = true
    
  }
}

resource "aws_security_group" "rds_sg" {
  name = "rds-security-group"
  description = "Security group for RDS database"
  vpc_id = module.vpc.vpc_id
}

resource "aws_iam_role" "lambda_monitor_role" {
    name = "Infrastracture-monitor-role"

    assume_role_policy = jsonencode({
        version = "2012-10-17"
        statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    service = "lambda.amazonaws.com"
                }
            }
        ]
    })
}
provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source = "./modules/eks"
  cluster_name = "Monitoring-platform"
  cluster_subnet_ids = concat(module.vpc.public_subnet_ids, module.vpc.private_subnet_ids)
  node_group_subnet_ids = module.vpc.private_subnet_ids
}

module "rds" {
  source = "./modules/rds"
  password = var.db_password
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}

module "kms" {
  source = "./modules/kms"
}

module "cloudtrail" {
  source = "./modules/cloudtrail"
}

module "eventbridge" {
  source = "./modules/eventbridge"
}

module "sqs" {
  source = "./modules/sqs"
}

module "sns" {
  source = "./modules/sns"
}

module "lambda" {
  source = "./modules/lambda"
  lambda_function_name = "security-event-processor"
  lambda_s3_bucket = "security-processor"
  lambda_s3_key =  "security_processor.zip"
  lambda_handler = "handler.main"
  lambda_role_arn = aws_iam_role.lambda_monitor_role.arn
}

module "api_gateway" {
  source = "./modules/api_gateway"
}

module "waf" {
  source = "./modules/waf"
}

module "elasticache" {
  source = "./modules/elasticache"
  subnet_ids = module.vpc.private_subnet_ids
  

}
