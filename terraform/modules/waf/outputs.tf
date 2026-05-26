output "web_acl_arn" {
  value = aws_wafv2_web_acl.api_acl.arn
}

output "web_acl_id" {
  value = aws_wafv2_web_acl.api_acl.id
}
