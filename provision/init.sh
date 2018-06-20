#!/usr/bin/env bash



sudo apt-get update
#sudo apt-get install -y python-software-properties
#sudo add-apt-repository ppa:ondrej/php
#sudo apt-get update && sudo apt-get dist-upgrade
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nginx mysql-server mysql-client php5 php5-cli php5-xdebug php5-mysql php5-curl php5-fpm php-pear php5-xmlrpc php5-snmp php-soap php5-gd php5-curl
sudo ln -s /vagrant/config/nginx.conf /etc/nginx/conf.d/test.loc.conf
sudo ln -s /vagrant/config/php.ini /etc/php5/fpm/conf.d/xdebug-custom.ini
sudo mysql -e "CREATE DATABASE test;"
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant/code /var/www
fi
sudo update-rc.d nginx defaults
sudo nginx
sudo nginx -s reload
sudo service mysql restart