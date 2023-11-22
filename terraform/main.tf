terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 5.24.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-west-2"
}

resource "aws_instance" "test_instance" {
  ami           = "ami-00448a337adc93c05" #Amazon Linux 2023 AMI# #"ami-830c94e3"#
  instance_type = "t3.nano"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = file("user_data.sh") // Static File

  user_data_replace_on_change = true

  tags = {
    Name = "test_instance"
    Owner = "Wagner Hilario"
    Project = "Test CD-IAC"
  }
}

##################
