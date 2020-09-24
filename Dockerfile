FROM docker.io/php:fpm-alpine

RUN apk add --no-cache --virtual .phpize-deps autoconf dpkg-dev dpkg file g++ gcc libc-dev make pkgconf re2c imagemagick-dev libtool postgresql-dev && \
    apk add --no-cache libzip-dev imagemagick && \
    export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" && \
    pecl install imagick && \
    docker-php-ext-enable imagick && \
    docker-php-ext-install pdo pdo_pgsql zip exif && \
    apk del --purge .phpize-deps
