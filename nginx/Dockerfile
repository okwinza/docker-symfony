FROM alpine:3.8

MAINTAINER Vincent Composieux <vincent.composieux@gmail.com>

RUN apk add --no-cache tzdata

RUN apk add --update nginx gettext
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*

COPY nginx.conf /etc/nginx/
COPY symfony.conf.template /etc/nginx/conf.d/symfony.conf.template

RUN adduser -D -g '' -G www-data www-data

COPY docker-entrypoint.sh /
RUN dos2unix -u /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx"]
