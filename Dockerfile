
FROM ubuntu:bionic 

RUN apt update -y && apt install -y pache2 \ 
	libapache2-mod-php \
	php-xml \
	wget  \
	&& a2enmod rewrite \
	&& sudo chown -R www-data:www-data /var/www/dokuwiki
