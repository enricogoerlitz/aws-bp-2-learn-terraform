terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "learn-terraform-bucket-xyc"
    region = "eu-central-1"
    key = "state.tfstate"
    # dynamodb_table = "tablename"
  }
}

provider "aws" {
  region = "eu-central-1"
}
