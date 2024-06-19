resource "random_id" "s3_bucket_suffix" {
  byte_length = 6
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "new-created-s3-bucket-${random_id.s3_bucket_suffix.hex}"
}
