resource "aws_instance" "web" {
  ami                         = "ami-0a0252f7a2b921692" # AMI of bitnami-nginx
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public.id
  instance_type               = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.public_http_traffic.id
  ]
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }

  tags = local.common_tags

  lifecycle {
    create_before_destroy = true
    # ignore_changes = [ tags ]  # when the tags will updated in the console or other external changes; can also been used for other configs
  }
}

resource "aws_security_group" "public_http_traffic" {
  name        = "public-http-traffic"
  description = "Allows http traffic"
  vpc_id      = aws_vpc.main.id
  tags        = local.common_tags

}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.public_http_traffic.id
  description       = "Allow http traffic"
  cidr_ipv4         = "0.0.0.0/0"
  to_port           = 80
  from_port         = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.public_http_traffic.id
  description       = "Allow http traffic"
  cidr_ipv4         = "0.0.0.0/0"
  to_port           = 443
  from_port         = 443
  ip_protocol       = "tcp"
}
