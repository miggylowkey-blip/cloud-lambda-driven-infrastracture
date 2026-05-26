variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_handler" {
  description = "Lambda handler entrypoint"
  type        = string
}

variable "lambda_runtime" {
  description = "Lambda runtime"
  type        = string
  default     = "python3.11"
}

variable "lambda_s3_bucket" {
  description = "S3 bucket containing Lambda deployment packages"
  type        = string
}

variable "lambda_s3_key" {
  description = "S3 object key for Lambda deployment package"
  type        = string
}

variable "lambda_role_arn" {
    description = "The ARN of the IAM execution role for the lambda function"
    type = string
}

resource "aws_iam_role" "lambda_role" {
  name               = "${var.lambda_function_name}-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

resource "aws_iam_policy_attachment" "lambda_basic_execution" {
  name       = "${var.lambda_function_name}-basic-execution"
  roles      = [aws_iam_role.lambda_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "function" {
  function_name = var.lambda_function_name
  s3_bucket     = var.lambda_s3_bucket
  s3_key        = var.lambda_s3_key
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  role          = aws_iam_role.lambda_role.arn
}

data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}


data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "${path.root}/../lambdas/security_processor"
  output_path = "${path.module}/dist/monitor.zip"
}

resource "aws_lambda_function" "lambda" {
    filename = "data.archive_file.output_path"
    function_name = "security-processor"
    handler = var.lambda_handler
    runtime = "python3.12"
    role = var.lambda_role_arn

    source_code_hash = data.archive_file.lambda.output_base64sha256
}