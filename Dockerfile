FROM ubuntu:bionic 
ENV DEBIAN_FRONTEND=noninteractive
#VOLUME ["/var/www"]
COPY dokuwiki.tgz /root/ 
RUN apt-get update -y && apt-get upgrade -y \
	&& apt-get install -y apache2 \ 
	libapache2-mod-php \
	php-xml \
	sudo \
	&&   useradd -m -s /bin/bash smuk \
	&& cd /root  \
        && tar -xvf  dokuwiki.tgz  \
	&& mv dokuwiki /var/www/ \
	&& chown -R www-data:www-data /var/www/dokuwiki \
	&& usermod -aG  sudo smuk \
	&& echo "%sudo  ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers \ 
	&& a2enmod rewrite 
COPY  000-default.conf /etc/apache2/sites-available/
COPY  dokuwiki.tgz /var/www/
#RUN  chown -R www-data:www-data /var/www/dokuwiki 
USER smuk
CMD sudo /etc/init.d/apache2 start | tail -f /dev/null 
#&& mv /root/000-default.conf /etc/apache2/sites-available/ \
#&& wget  https://download.dokuwiki.org/out/dokuwiki-27165eda69bc9d98d01d24baa9199b96.tgz \
# && tar xvf dokuwiki-27165eda69bc9d98d01d24baa9199b96.tgz  \
 #&& rm -r  dokuwiki-27165eda69bc9d98d01d24baa9199b96.tgz \
 #&& mv dokuwiki /var/www/ \
