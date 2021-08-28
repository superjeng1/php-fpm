FROM docker.io/php@sha256:7193180ad7104d4c74d17cd7d36ccd9f025ded84fd7b6a7a03e14f4f6682ea2e
# The above is checksum of docker.io/alpine:latest and will be automatically updated by GitHub actions

RUN apk add --no-cache --virtual .phpize-deps autoconf dpkg-dev dpkg file g++ gcc libc-dev make pkgconf re2c imagemagick-dev libtool && \
    apk add --no-cache libzip-dev imagemagick postgresql-dev && \
    export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" && \
    pecl install imagick && \
    docker-php-ext-enable imagick && \
    docker-php-ext-install pgsql pdo pdo_pgsql zip exif pdo_mysql mysqli opcache && \
    apk del --purge .phpize-deps