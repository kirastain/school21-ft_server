FROM debian:buster

#just the update
RUN apt-get update

#install PHP
RUN apt-get install -y php7.4-{mysql,pdo,curl,fpm,cli,common,cgi}

#install nginx
RUN apt-get install -y nginx

#install mariadb
RUN apt-get install -y mariadb-server

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
RUN sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
															 -out /etc/ssl/certs/nginx-selfsigned.crt

COPY ./srcs/init.sh ./
COPY ./srcs/nginx.conf ./etc/nginx/sites-available/
COPY  ./srcs/wp-config.php ./var/www/wordpress/

CMD ["bash", "init.sh"]