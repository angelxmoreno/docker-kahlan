# Use Alpine Linux
FROM php:7.2-fpm-alpine3.7

MAINTAINER Angel S. Moreno <angelxmoreno@gmail.com>

# Installing Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Tweak up PHP cli configuration
RUN echo -n 'memory_limit=-1' > /usr/local/etc/php/conf.d/memory-limit.ini

# Install Xdebug
RUN apk add --update --no-cache --virtual .tools-deps \
            autoconf g++ libtool make \
 && (yes | pecl install xdebug) \
 && apk del .tools-deps \
 && rm -rf /var/cache/apk/*

VOLUME ["/app"]

WORKDIR /app
