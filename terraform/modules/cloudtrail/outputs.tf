output "trail_arn" {
  value = aws_cloudtrail.trail.arn
}

output "bucket_name" {
  value = aws_s3_bucket.cloudtrail_bucket.id
}
