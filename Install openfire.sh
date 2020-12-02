#!/bin/bash

yum -y install glibc wget
wget https://www.igniterealtime.org/downloadServlet?filename=openfire/openfire-4.6.0-1.noarch.rpm
yum -y install *.rpm
chkconfig openfire on
systemctl start openfire.service
yum -y install mariadb-server
systemctl start mariadb.service
systemctl enable mariadb
mysql_secure_installation

echo "CREATE DATABASE openfire;" | mysql -uroot -pcarryon
echo "CREATE USER 'openfire'@'localhost' IDENTIFIED BY 'password';" | mysql -uroot -pcarryon
echo "GRANT ALL PRIVILEGES ON openfire.* TO 'openfire'@'localhost';" | mysql -uroot -pcarryon
echo "FLUSH PRIVILEGES;" | mysql -uroot -pcarryon
