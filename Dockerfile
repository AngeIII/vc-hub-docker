FROM ubuntu:14.04
MAINTAINER WPBakery hello@wpbakery.com
RUN apt-get update \
&& apt-get install -y software-properties-common \
&& apt-get install -y php56 php56-mcrypt php56-cli php56-mysql php56-curl \
&& apt-get install -y git \
&& apt-get install -y curl \
&& apt-get install -y --force-yes apt-transport-https \
&& curl --silent --location https://deb.nodesource.com/setup_6.x | sudo bash - \
&& apt-get install -y nodejs \
&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& npm install -g bower \
&& npm install -g gulp \
&& apt-get autoremove -y \
&& apt-get clean

