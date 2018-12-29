#!/usr/bin/env sh
set -euo pipefail

# Allow the Symfony application to write inside volumes
mkdir -p /var/www/app/var/ && chown -R www-data /var/www/app/var/

mkdir -p /var/log/php
touch /var/log/php/php.log
touch /var/log/php/php-slow.log
touch /var/log/php/php-fpm.log

chown -R www-data /var/log/php

exec "$@"