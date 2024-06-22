terraform {
  required_version = "~> v1.8.5"
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
}

provider "aws" {
  region = "eu-central-1"
}

provider "aws" {
  region = "eu-west-2"
  alias  = "eu_west_2"
}
