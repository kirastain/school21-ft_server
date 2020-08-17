#!/bin/bash
echo "Init script begin"

#Start nginx
cp /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf
rm -rf /etc/nginx/sites-enabled/default
service nginx restart

#Start php-fpm
service php7.3-fpm restart

#Start mysql
service mysql restart
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
bash