# Lambda Module

This module packages Lambda deployment artifacts and provisions Lambda functions plus IAM execution roles.

## Inputs

- `lambda_function_name`
- `lambda_handler`
- `lambda_runtime`
- `lambda_s3_bucket`
- `lambda_s3_key`

## Outputs

- `function_name`
- `function_arn`
- `lambda_role_arn`
