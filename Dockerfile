# Use Alpine Linux
FROM php:7.2-cli-alpine3.8

MAINTAINER Angel S. Moreno <angelxmoreno@gmail.com>

# Installing Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Xdebug
RUN apk update \
    && apk add  --no-cache g++ make autoconf \
    && docker-php-source extract \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && docker-php-source delete \
    && rm -rf /tmp/*

# Tweak up PHP cli configuration
RUN echo -n 'memory_limit=-1' > /usr/local/etc/php/conf.d/memory-limit.ini

VOLUME ["/app"]

WORKDIR /app
