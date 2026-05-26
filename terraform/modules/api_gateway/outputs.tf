output "api_id" {
  value = aws_apigatewayv2_api.query_api.id
}

output "api_url" {
  value = aws_apigatewayv2_stage.default.invoke_url
}
