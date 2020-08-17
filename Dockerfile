FROM debian:buster

#just the update and utils
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y curl

#install PHP
RUN apt-get install -y php-mysql php-pdo php-curl php-fpm php-cli php-common php-cgi

#install nginx
RUN apt-get install -y nginx

#install mariadb
#RUN apt-get install -y mariadb-server
RUN apt-get install -y default-mysql-server

#install phpmyadmin
RUN apt-get install -y wget
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar -xzvf phpMyAdmin-5.0.2-all-languages.tar.gz -C /var/www/
RUN mv /var/www/phpMyAdmin-5.0.2-all-languages /var/www/phpmyadmin
#RUN rm -rf phpMyAdmin-5.0.2-all-languages.tar.gz

#install WordPress
RUN wget -c http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz

#generate SSL
RUN openssl req -x509 \
-nodes -days 365 \
-newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt \
-subj '/C=RU/ST=Moscow/L=Moscow/O=School42/OU=School21/CN=bbelen'

#copy into the docker filesystem
COPY ./srcs/init.sh ./
COPY ./srcs/nginx.conf /etc/nginx/sites-available/
COPY  ./srcs/wp-config.php ./
COPY ./srcs/config.inc.php /var/www/phpmyadmin/
COPY ./srcs/intro.html /var/www/

EXPOSE 80 443

#start services
RUN service nginx start && service php7.3-fpm start && service mysql start

#wordpress adjust
RUN rm wordpress/wp-config-sample.php
RUN mv wordpress /var/www/
RUN mv wp-config.php /var/www/wordpress

RUN chown -R www-data:www-data /var/www
RUN chmod 755 -R ./var/www/*

CMD ["bash", "init.sh"]