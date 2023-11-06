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

  user_data = <<EOF
#!/bin/bash
sudo apt -y update
sudo apt -y install httpd apache2 git
MYIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>WebServer with PrivateIP: $MYIP</h2><br>Built by Terraform" > /var/www/html/index.html
service apache2 start
#chkconfig apache2 on
EOF

  user_data_replace_on_change = true

  tags = {
    Name = "test_instance"
    Owner = "Wagner Hilario"
    Project = "Test CD-IAC"
  }
}

#################
