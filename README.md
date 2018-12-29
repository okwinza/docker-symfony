Real Docker environment for Symfony apps
==============

This is a complete and hightly flexible stack for running Symfony 4 (latest version: Flex) into Docker containers using docker-compose tool.

## Features
* Flexible and easily configurable. 
* (Almost) production-ready.
* Uses it's own makefile to manage the environment.

## Installation

* Clone the repository into `docker` folder (or wherever you wish).
* Make sure you have `make` installed on your host machine.
* Copy `.env.dist` into `.env` and configure to your liking.
* Use `make start` to build & start the env.


## Services
* `nginx`: [nginx:1.15-alpine](nginx/Dockerfile) custom NGINX image.
* `php-fpm`: [php:7.2-fpm-alpine](php/Dockerfile) custom image with additional extensions and Composer.
* `redis`: [redis:5.0-alpine](https://hub.docker.com/_/mysql/) official Redis image.
* `elk`: [willdurand/elk](https://hub.docker.com/r/willdurand/elk) complete ELK stack.
* `rabbitmq`: [rabbitmq:3.7-management-alpine](https://hub.docker.com/_/rabbitmq/) RabbitMQ image with admin UI.

## Logs

You can access Nginx and your application logs in the following directories on your host machine:

* `logs/nginx`
* `logs/app`

## Documentation

> In order to make things more readable, and maintainable, the documentation has been migrated to
the [repository Wiki](https://github.com/okwinza/docker-symfony/wiki). Where you will find all details about the 
installation process along the available instructions for the day-to-day work.

## Code license

You are free to use the code in this repository under the terms of the 0-clause BSD license. LICENSE contains a copy of this license.

## Useful links

This docker setup is based on following works:
* [ajardin/docker-symfony](https://github.com/ajardin/docker-symfony)
* [eko/docker-symfony](https://github.com/eko/docker-symfony)