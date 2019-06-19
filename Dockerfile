
FROM ubuntu:bionic 

COPY  sudoers /root 
COPY  000-default.conf /root/

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt install -y apache2 \ 
	libapache2-mod-php \
	php-xml \
	wget  \
	&&   useradd -m -s /bin/bash smuk \
	&& usermod -aG  sudo smuk \
        &&  mv /root/sudoers /etc/ \
        && chmod 440 /etc/sudoers \
	&& chown root:root /etc/sudoers \
	&& a2enmod rewrite \
        && mv /root/000-default.conf /etc/apache2/sites-available/ \
        && wget  https://download.dokuwiki.org/out/dokuwiki-27165eda69bc9d98d01d24baa9199b96.tgz \
        && tar xvf dokuwiki-27165eda69bc9d98d01d24baa9199b96.tgz  \
        && rm -r  dokuwiki-27165eda69bc9d98d01d24baa9199b96.tgz \
        && mv dokuwiki /var/www/ \
	&& sudo chown -R www-data:www-data /var/www/dokuwiki \


USER smuk

CMD sudo /etc/init.d/apache2 start


