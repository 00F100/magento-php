FROM alpine:latest

ARG USER_ID=1000

ENV PATH "/opt/php/bin:/opt/php/sbin:$PATH"
ENV PS1="┌───────────────────\n│[\033[0;31m\e[1m\u\e[0m\033[0m]@[\e[34m\php 7.1.31\033[0m][\e[34mcomposer 1.9.0\033[0m][\e[34mnpm 6.9.0\033[0m]\n│[\[\e[32m\]\w\[\e[0m\]]\n└─╼ "

COPY 7.1.31/transfer-data /opt/php
COPY ["7.1.31/transfer-libs/libexslt.so.0", "7.1.31/transfer-libs/libstdc++.so.6", "7.1.31/transfer-libs/libintl.so.8", "7.1.31/transfer-libs/libpng16.so.16", "7.1.31/transfer-libs/libjpeg.so.8", "7.1.31/transfer-libs/libcurl.so.4", "7.1.31/transfer-libs/libfreetype.so.6", "7.1.31/transfer-libs/libicuio.so.64", "7.1.31/transfer-libs/libicui18n.so.64", "7.1.31/transfer-libs/libicuuc.so.64", "7.1.31/transfer-libs/libgcc_s.so.1", "7.1.31/transfer-libs/libxml2.so.2", "7.1.31/transfer-libs/libxslt.so.1", "7.1.31/transfer-libs/libgcrypt.so.20", "7.1.31/transfer-libs/libnghttp2.so.14", "7.1.31/transfer-libs/libbz2.so.1", "7.1.31/transfer-libs/libicudata.so.64", "7.1.31/transfer-libs/libgpg-error.so.0", "/usr/lib/"]

RUN apk update \
    && apk add --update shadow git nodejs npm \
    && useradd -u ${USER_ID} -d /var/www www-data -s /bin/sh -M \
    && mkdir -p /var/www/html \
    && rm -Rf /var/cache/apk/* \
    && cd ~ \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && chown -R www-data:www-data /var/www \
    && rm -Rf /var/cache/apk \
    && echo "fs.inotify.max_user_watches=524288" > /etc/sysctl.d/99-sysctl.conf

VOLUME /var/www/html /var/log/php /opt/php/var/log /var/www/.composer /var/www/.ssh

WORKDIR /var/www/html   
