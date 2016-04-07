#!/usr/bin/env sh
set -vex
cd /tmp


apk --update add --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ \
  php7                                                                         \
  php7-xmlrpc                                                                  \
  php7-gd                                                                      \
  php7-pdo_mysql                                                               \
  php7-mysqlnd                                                                 \
  php7-mysqli                                                                  \
  php7-session                                                                 \
  php7-json                                                                    \
  php7-zlib                                                                    \
  php7-phar                                                                    \
  php7-mcrypt                                                                  \
  php7-opcache                                                                 \
  php7-openssl                                                                 \
  php7-dom                                                                     \
  php7-xml                                                                     \
  php7-mysqli                                                                  \
  php7-apache2                                                                 \
  php7-pdo                                                                     \
  php7-ctype                                                                   \
  php7-curl                                                                    \
  php7-intl                                                                    \
  php7-bcmath                                                                  \
  php7-dom                                                                     \
  php7-xmlreader                                                               \
  apache2-utils

# remove php7 prefix from testing build (TODO compile ownself)
ln -s /etc/php7 /etc/php
ln -s /usr/bin/php7 /usr/bin/php
ln -s /usr/lib/php7 /usr/lib/php
sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/php.ini

mkdir -p /var/www /var/app/www
chown -R $USER_NAME:$USER_NAME /var/www /var/app
chmod -R 660 /var/www /var/app

# clean up
rm -rf /var/cache/apk/* /tmp/* /var/tmp/*
