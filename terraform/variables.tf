variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "ap-southeast-2"
}

variable "state_bucket" {
  description = "S3 bucket name for Terraform state storage"
  type        = string
  default     = "security-processor"
}

variable "state_lock_table" {
  description = "DynamoDB table name for Terraform state locking"
  type        = string
  default     = "terraform-lock-table"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable db_password {
    description = "The password for the RDS database"
    type = string
    sensitive = true
    
}