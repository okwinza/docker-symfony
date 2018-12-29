FROM php:7.2-fpm-alpine

LABEL maintainer="Oleg Krasavin <okwinza@gmail.com>"

ENV IGBINARY_VERSION=2.0.8 \
   PHP_MEMCACHED_VERSION=3.1.2 \
   PHPREDIS_VERSION=4.2.0 \
   PHP_AMQP_VERSION=1.9.3

RUN apk upgrade --update --no-cache && \
    apk add --update --no-cache \
    ca-certificates \
    curl \
    bash

RUN apk add --no-cache tzdata

RUN apk add --update --no-cache \
    php7-apcu \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-gd \
    php7-iconv \
    php7-imagick \
    php7-json \
    php7-intl \
    php7-mcrypt \
    php7-fileinfo \
    php7-mbstring \
    php7-opcache \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-mysqli \
    php7-xml \
    php7-xsl \ 
    php7-xmlwriter \ 
    php7-xmlreader \ 
    php7-soap \ 
    php7-imap \
    php7-zlib \
    php7-phar \
    php7-tokenizer \
    php7-session \
    php7-simplexml \
    php7-zip \
    php7-ftp

RUN apk add --update --no-cache libmemcached rabbitmq-c

RUN apk add --update --no-cache --virtual .build-deps git file re2c autoconf make g++ php7-dev libmemcached-dev cyrus-sasl-dev zlib-dev musl rabbitmq-c-dev pcre-dev && \
    \
    git clone --depth=1 -b ${IGBINARY_VERSION} https://github.com/igbinary/igbinary.git /tmp/php-igbinary && \
    cd /tmp/php-igbinary && \
    phpize && ./configure CFLAGS="-O2 -g" --enable-igbinary && make && make install && \
    cd .. && rm -rf /tmp/php-igbinary/ && \
    echo 'extension=igbinary.so' >> /usr/local/etc/php/conf.d/igbinary.ini && \
    \
    git clone --depth=1 -b v${PHP_MEMCACHED_VERSION} https://github.com/php-memcached-dev/php-memcached.git /tmp/php-memcached && \
    cd /tmp/php-memcached && \
    phpize && ./configure --disable-memcached-sasl && make && make install && \
    cd .. && rm -rf /tmp/php-memcached/ && \
    echo 'extension=memcached.so' >> /usr/local/etc/php/conf.d/memcached.ini && \
    \
    git clone --depth=1 -b ${PHPREDIS_VERSION} https://github.com/phpredis/phpredis.git /tmp/php-redis && \
    cd /tmp/php-redis && \
    phpize &&  ./configure --enable-redis-igbinary && make && make install && \
    cd .. && rm -rf /tmp/php-redis/ && \
    echo 'extension=redis.so' >> /usr/local/etc/php/conf.d/redis.ini && \
    \
    git clone --depth=1 -b v${PHP_AMQP_VERSION} https://github.com/pdezwart/php-amqp.git /tmp/php-amqp && \
    cd /tmp/php-amqp && \
    phpize && ./configure && make && make install && \
    cd .. && rm -rf /tmp/php-amqp/ && \
    echo 'extension=amqp.so' >> /usr/local/etc/php/conf.d/amqp.ini && \
    \
    apk del .build-deps

RUN rm -rf /var/cache/apk/* && rm -rf /tmp/* && \
    curl --insecure https://getcomposer.org/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer

COPY php.ini /usr/local/etc/php/php.ini
COPY php-fpm.conf /usr/local/etc/php-fpm.conf

WORKDIR /var/www/app
