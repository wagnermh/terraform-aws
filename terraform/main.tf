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
  ami           = "ami-830c94e3"
  instance_type = "t2.nano"

  user_data = file("user_data.sh") // Static File

  user_data_replace_on_change = true

  tags = {
    Name = "test_instance"
    Owner = "Wagner Hilario"
    Project = "Test CD-IAC"
  }
}

#################
