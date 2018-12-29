#!/usr/bin/env sh
set -eu

envsubst '${APP_PHPFPM_PORT} ${APP_NGINX_SERVER_NAME}' < /etc/nginx/conf.d/symfony.conf.template > /etc/nginx/conf.d/symfony.conf

exec "$@"