#!/bin/sh

yum update -y
yum install -y git

#!/bin/sh
yum install -y httpd
service httpd start
chkconfig httpd on

echo "Hello APP" > /var/www/html/index.html
