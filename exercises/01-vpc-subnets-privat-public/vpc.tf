terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
    region = "eu-central-1"
}

resource "aws_vpc" "demo_vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.demo_vpc.id
    cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.demo_vpc.id
    cidr_block = "10.0.1.0/24"
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.demo_vpc.id
}

resource "aws_route_table" "public_rtb" {
    vpc_id = aws_vpc.demo_vpc.id

    route = [{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
        carrier_gateway_id        = null
        core_network_arn          = null
        destination_prefix_list_id = null
        egress_only_gateway_id    = null
        ipv6_cidr_block           = null
        local_gateway_id          = null
        nat_gateway_id            = null
        network_interface_id      = null
        transit_gateway_id        = null
        vpc_endpoint_id           = null
        vpc_peering_connection_id = null
    }]
}

resource "aws_route_table_association" "public_subnet" {
    route_table_id = aws_route_table.public_rtb.id
    subnet_id = aws_subnet.public_subnet.id
}
