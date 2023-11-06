resource "aws_security_group" "instance" {
  name = "terraform-test_instance"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  egress {
    description = "Allow All Ports"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web Server SG by Terraform"
    Owner = "Wagner Hilario"
  }
}

##
