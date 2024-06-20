data "aws_ami" "aws_linux" {
  most_recent = true
  filter {
    name = "name"
    values = ["al2023-ami-*-kernel-6.1-x86_64"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_caller_identity" "current" { }

data "aws_region" "current" { }

data "aws_region" "eu_west_2" {
  provider = aws.eu_west_2
}

data "aws_vpc" "main" {
    tags = {
      "Env" = "Prod"
    }
}

output "aws_caller_identity" {
  value = data.aws_caller_identity.current
}

output "aws_region" {
  value = data.aws_region.current
}

output "aws_vpc" {
  value = data.aws_vpc.main
}

output "aws_linux_ami" {
  value = data.aws_ami.aws_linux
}
