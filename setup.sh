#!/bin/bash

chmod -R 775 /var/www/html/experience
chown -R apache:apache /var/www/html/experience
systemctl start httpd
systemctl enable httpd
rm -rf /etc/httpd/conf.d/php.conf
echo "Listen 8080" >> /etc/httpd/conf/httpd.conf
echo "" >> /etc/php.ini && echo "extension=oci8.so" >> /etc/php.ini
mv /var/www/html/experience/experience.conf /etc/httpd/conf.d/
mv /var/www/html/experience/oci8.so /usr/lib64/php/modules/