resource "aws_security_group" "instance" {
  name = "terraform-test_instance"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
}

#
