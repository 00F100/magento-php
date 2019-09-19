FROM alpine:latest

ARG USER_ID=1000
ARG PHP_VERSION=7.2.21

ENV PATH "/opt/php/bin:/opt/php/sbin:$PATH"

COPY configure-php /usr/local/bin/

RUN chmod +x /usr/local/bin/configure-php \
    && apk update \
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
        icu \
        git \
        build-base \
        gettext-dev \
        ca-certificates \
        g++ \
        libsodium-dev \
        libgc++ \
        libzip-dev \
        zip \
    && mkdir -p /opt/php/fpm \
    && mkdir -p /opt/php-src \
    && mkdir -p /var/www/html \
    && useradd -u ${USER_ID} -d /var/www www-data -s /bin/sh -M \
    && chown www-data:www-data /var/www \
    && cd /opt/php-src \
    && curl https://www.php.net/distributions/php-${PHP_VERSION}.tar.bz2 -o php-${PHP_VERSION}.tar.bz2 \
    && tar -jxf php-${PHP_VERSION}.tar.bz2 \
    && cd /opt/php-src/php-${PHP_VERSION} \
    && configure-php \
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