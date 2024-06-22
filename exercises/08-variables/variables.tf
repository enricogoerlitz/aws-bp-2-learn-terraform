# variables.rf for var-definition
# env.terraform.tfvars for setting variables

# variable "s3_bucket_name" {
#   type    = string
#   default = "bucket-suffix-default-name"  # default would not ask for variable, but can be overwritten by -var s3_bucket_name=".."

#   validation {
#     # condition     = var.s3_bucket_name == "" || var.s3_bucket_name == "..."
#     condition     = startswith(var.s3_bucket_name, "bucket-suffix-")
#     error_message = "Invalid S3 Name"
#   }
# }

variable "s3_bucket_config" {
  type = object({
    bucket_name = string
  })
  default = {
    bucket_name = "bucket-suffix-default-name"
  } # default would not ask for variable, but can be overwritten by -var s3_bucket_name=".."

  validation {
    # condition     = var.s3_bucket_name == "" || var.s3_bucket_name == "..."
    condition     = startswith(var.s3_bucket_config.bucket_name, "bucket-suffix-")
    error_message = "Invalid S3 Name"
  }
}

variable "additional_tags" {
  type = map(string) # Name="Test" Env="Prod"
  # default = {
  #   Name      = "name"
  #   Env       = "Prod"
  #   ManagedBy = "Terraform"
  # }

  # use: tags = merge(additional_tags, {}) in tags...
}

# object -> needs to define a structure
# map    -> doesnt require a structure; good for tags!
