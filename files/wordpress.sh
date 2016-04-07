#!/usr/bin/env sh
set -vex

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  -O /usr/local/bin/wp-cli

chmod +x /usr/local/bin/wp-cli

rm -rf /var/www
mkdir -p /var/www/public
mkdir -p /var/www/logs

chown -R apache:apache /var/www
chmod -R 0600 /var/www

rm -rf /tmp/*