#!/bin/bash
sudo apt -y update
sudo apt -y install apache2 git curl
MYIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>WebServer with PrivateIP: $MYIP</h2><br>Built by Terraform external file!" > /var/www/html/index.html
service apache2 start
chkconfig apache2 on
service apache2 status
