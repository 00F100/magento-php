FROM alpine:latest

ARG USER_ID=1000
ARG PHP_VERSION=7.2.20

ENV PATH "/opt/php/bin:/opt/php/sbin:/opt/docker:$PATH"

RUN apk update \
    && apk add shadow \
        tar \
        bzip2 \
        curl \
        curl-dev \
        autoconf \
        libjpeg-turbo-dev \
        libmcrypt-dev \
        c-client \
        libxml2-dev \
        openssl-dev \
        libpng-dev \
        freetype-dev \
        krb5-dev \
        libxslt-dev \
        gcc \
        icu-dev \
        icu-libs \
        git \
        build-base \
        gettext-dev \
        ca-certificates \
        g++ \
        libsodium-dev \
    && mkdir -p /opt/php/fpm \
    && mkdir -p /opt/docker \
    && mkdir -p /opt/php-src \
    && mkdir -p /var/www/html \
    && useradd -u ${USER_ID} -d /var/www www-data -s /bin/sh -M \
    && cd /opt/php-src \
    && curl https://www.php.net/distributions/php-${PHP_VERSION}.tar.bz2 -o php-${PHP_VERSION}.tar.bz2 \
    && tar -jxf php-${PHP_VERSION}.tar.bz2 \
    && cd /opt/php-src/php-${PHP_VERSION} \
    && ./configure \
        --prefix=/opt/php \
        --with-zlib-dir --with-freetype-dir \
        --with-libxml-dir=/usr \
        --with-curl \
        --with-zlib \
        --with-gd \
        --with-mhash \
        --with-pcre-regex \
        --with-pdo-mysql \
        --with-mysqli \
        --with-jpeg-dir=/usr \
        --with-png-dir=/usr \
        --with-openssl \
        --with-fpm-user=www-data \
        --with-fpm-group=www-data \
        --with-libdir=/usr/lib \
        --with-gettext \
        --with-xmlrpc \
        --with-xsl \
        --enable-mbstring \
        --enable-soap \
        --enable-bcmath \
        --enable-zip \
        --enable-opcache \
        --enable-fpm \
        --enable-intl \
        --enable-maintainer-zts \
        --disable-rpath \
        --without-sqlite3 \
        --without-pdo-sqlite \
        --without-pgsql \
        --with-sodium=shared \
    && cd /opt/php-src/php-${PHP_VERSION} \
    && make -j "$(nproc)"\
    && make install \
    && pecl install xdebug \
    && rm -Rf /opt/php-src \
    && rm -f /opt/php/bin/php-cgi \
    && rm -f /opt/php/bin/phpdbg \
    && rm -Rf /opt/php/lib/php/doc \
    && rm -Rf /opt/php/php/man
    
CMD ["/bin/sh"]