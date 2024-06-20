variable "s3_bucket_name" {
  type    = string
  default = "default-name"

  validation {
    condition     = var.s3_bucket_name == "" || var.s3_bucket_name == "..."
    error_message = "Invalid S3 Name"
  }
}