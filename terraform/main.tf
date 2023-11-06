terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.24.0"
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

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              #sudo upgrade -y
              sudo apt-get install -y apache2 php git
              #sudo git clone https://github.com/brikis98/php-app.git /var/www/html/app
              sudo service apache2 start
              EOF

  user_data_replace_on_change = true

  tags = {
    Name = "test_instance"
  }
}

###############
