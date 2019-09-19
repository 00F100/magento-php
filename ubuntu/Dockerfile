FROM ubuntu:18.04

ARG USER_ID=1000
ARG PHP_VERSION=7.3.8

ENV PATH "/opt/php/bin:/opt/php/sbin:$PATH"

COPY configure-php /usr/local/bin/

RUN chmod +x /usr/local/bin/configure-php \
	&& apt-get update \
	&& apt-get install -y \
		build-essential \
		tar \
		bzip2 \
		curl \
		autoconf \
		libjpeg-turbo8-dev \
		libmcrypt-dev \
		libxml2-dev \
		openssl \
		libssl-dev \
		libpng-dev \
		libfreetype6-dev \
		libkrb5-dev \
		libxslt1-dev \
		gcc \
		libicu-dev \
		git \
		libgettextpo-dev \
		ca-certificates \
		g++ \
		libsodium-dev \
		libzip-dev \
		zip \
		libcurl4-openssl-dev \
	&& mkdir -p /opt/php/fpm \
    && mkdir -p /opt/php-src \
    && mkdir -p /var/www/html \
    && deluser www-data \
    && useradd -u ${USER_ID} -d /var/www www-data -s /bin/bash -M \
    && chown -R www-data:www-data /var/www \
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

CMD ["/bin/bash"]