FROM docker.io/php@sha256:ed4986419144b91741e2a48746fec0de2b16e6e51b0e4a72144a5d1222e6c0cc
# The above is checksum of docker.io/alpine:latest and will be automatically updated by GitHub actions

RUN apk add --no-cache --virtual .phpize-deps autoconf dpkg-dev dpkg file g++ gcc libc-dev make pkgconf re2c libtool && \
    apk add --no-cache libzip-dev postgresql-dev && \
    export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" && \
    docker-php-ext-install pgsql pdo pdo_pgsql zip exif pdo_mysql mysqli opcache && \
    apk del --purge .phpize-deps
