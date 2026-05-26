resource "aws_sqs_queue" "event_queue" {
  name                      = var.queue_name
  visibility_timeout_seconds = 60
  message_retention_seconds  = 1209600
  delay_seconds              = 0
}
