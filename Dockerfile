FROM ubuntu:14.04
MAINTAINER WPBakery hello@wpbakery.com
# Enable PHP 5.6 repo and update apt-get
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

RUN rm -rf /etc/apt/sources.list.d/ondrej-php-*

RUN apt-get update && apt-get install -y --force-yes python-software-properties software-properties-common
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:ondrej/php
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:ondrej/php-qa

RUN apt-get update

RUN apt-get install -y --force-yes --no-install-recommends curl git

RUN apt-get install -y --force-yes php5.6-fpm php5.6-common php5.6-cli php-pear php5.6-curl php5.6-gd php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-readline \
&& apt-get install -y --force-yes apt-transport-https \
&& curl --silent --location https://deb.nodesource.com/setup_6.x | sudo bash - \
&& apt-get install -y --force-yes nodejs \
&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& npm install -g bower \
&& npm install -g gulp \
&& apt-get --purge autoremove -y \
&& apt-get clean
