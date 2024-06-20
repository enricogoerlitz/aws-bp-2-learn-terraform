resource "random_id" "s3_bucket_suffix" {
  byte_length = 6
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "s3-bucket-eu-central-1-${random_id.s3_bucket_suffix.hex}"
}

resource "aws_s3_bucket" "s3_bucket_" {
  bucket   = "s3-bucket-eu-west-2-${random_id.s3_bucket_suffix.hex}"
  provider = aws.eu-west-2
}
