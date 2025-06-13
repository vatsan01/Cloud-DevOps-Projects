resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "trail_bucket" {
  bucket        = "srivatsan-cloudtrail-logs-${random_id.bucket_id.hex}"
  force_destroy = true
}

resource "aws_cloudtrail" "trail" {
  name                          = "example-trail"
  s3_bucket_name                = aws_s3_bucket.trail_bucket.id
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true
}
