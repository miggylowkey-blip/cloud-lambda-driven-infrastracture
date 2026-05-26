resource "aws_cloudwatch_event_bus" "default" {
  name = var.bus_name
}

resource "aws_cloudwatch_event_rule" "all_events" {
  name        = "all-events-rule"
  event_bus_name = aws_cloudwatch_event_bus.default.name
  event_pattern = jsonencode({
    source = ["aws.ec2", "aws.s3", "aws.lambda", "aws.rds"]
  })
}
