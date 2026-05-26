variable "bucket_name" {
  description = "Name of the S3 bucket to hold CloudTrail logs"
  type        = string
  default     = "cloud-event-driven-cloudtrail-logs"
}

variable "trail_name" {
  description = "Name of the CloudTrail trail"
  type        = string
  default     = "cloud-event-driven-trail"
}
