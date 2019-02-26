FROM ubuntu:18.04
MAINTAINER Jundat95

# Update
RUN apt update

# Install all application 
RUN apt install mysql-server
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

RUN apt install nginx

RUN apt install php7.2-common php7.2-cli php7.2-fpm php7.2-opcache php7.2-gd php7.2-mysql php7.2-curl php7.2-intl php7.2-xsl php7.2-mbstring php7.2-zip php7.2-bcmath php7.2-soap

RUN apt install openssh-server

RUN apt install vim

RUN apt install git

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY magento.local /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/magento.local /etc/nginx/sites-enable/

COPY ./magento230 /var/www/magento230

# EXPOSE PORT
EXPOSE 80 443 22 3306