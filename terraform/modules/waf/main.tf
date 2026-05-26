resource "aws_wafv2_web_acl" "api_acl" {
  name        = var.acl_name
  scope       = "REGIONAL"
  default_action {
    allow {}
  }
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = var.acl_name
    sampled_requests_enabled   = true
  }
  rule {
    name     = "rate-limit"
    priority = 1
    statement {
      rate_based_statement {
        limit              = 2000
        aggregate_key_type = "IP"
      }
    }
    action {
      block {}
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "rate-limit"
      sampled_requests_enabled   = true
    }
  }
}
