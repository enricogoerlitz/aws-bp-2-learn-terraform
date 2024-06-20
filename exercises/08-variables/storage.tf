resource "aws_s3_bucket" "main" {
  bucket = var.s3_bucket_config.bucket_name

  tags = merge(var.additional_tags, {
    Department = "IT"
  })
}
