#!/bin/bash
yum install httpd -y

systemctl start httpd
systemctl enable httpd

echo "<h1> My First webpage through terraform code </h1>" > /var/www/html/index.html
