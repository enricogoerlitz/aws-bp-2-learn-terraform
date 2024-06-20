resource "aws_instance" "web" {
  ami                         = "ami-0a0252f7a2b921692"
  associate_public_ip_address = true
  instance_type               = "t2.micro"

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }

  lifecycle {
    create_before_destroy = true
    # ignore_changes = [ tags ]  # when the tags will updated in the console or other external changes; can also been used for other configs
  }
}