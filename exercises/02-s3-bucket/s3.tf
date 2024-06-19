resource "random_id" "s3_bucket_suffix" {
  byte_length = 6
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "example-bucket-${random_id.s3_bucket_suffix.hex}"
}

output "bucket_name" {
  value = random_id.s3_bucket_suffix.hex
}
