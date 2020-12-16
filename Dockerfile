FROM docker.io/php@sha256:5ccb23182245abcb5f6214abcb1f6f0381ea28af5d30297fd21fcfd71bc23bee
# The above is checksum of docker.io/alpine:latest and will be automatically updated by GitHub actions

RUN apk add --no-cache --virtual .phpize-deps autoconf dpkg-dev dpkg file g++ gcc libc-dev make pkgconf re2c imagemagick-dev libtool && \
    apk add --no-cache libzip-dev imagemagick postgresql-dev && \
    export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" && \
    pecl install imagick && \
    docker-php-ext-enable imagick && \
    docker-php-ext-install pgsql pdo pdo_pgsql zip exif pdo_mysql mysqli opcache && \
    apk del --purge .phpize-deps