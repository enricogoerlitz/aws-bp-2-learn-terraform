locals {
  common_tags = {
    Name    = "01-nginx-in-subnet"
    Project = "01-nginx-in-subnet"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  # merge() merges two objects
  tags = merge(
    local.common_tags,
    {
      Name          = "01-nginx-in-subnet-overwritten"
      AdditionalTag = "AddTag"
    }
  )
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"

  tags = local.common_tags
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = local.common_tags
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.main.id
      carrier_gateway_id         = null
      core_network_arn           = null
      destination_prefix_list_id = null
      egress_only_gateway_id     = null
      ipv6_cidr_block            = null
      local_gateway_id           = null
      nat_gateway_id             = null
      network_interface_id       = null
      transit_gateway_id         = null
      vpc_endpoint_id            = null
      vpc_peering_connection_id  = null
    }
  ]

  tags = local.common_tags
}

resource "aws_route_table_association" "public" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public.id
}
