FROM alpine:latest

ARG USER_ID=1000

ENV PATH "/opt/php/bin:/opt/php/sbin:$PATH"

COPY 7.3.30/transfer-data /opt/php
COPY ["7.3.30/transfer-libs/libexslt.so.0", "7.3.30/transfer-libs/libstdc++.so.6", "7.3.30/transfer-libs/libintl.so.8", "7.3.30/transfer-libs/libpng16.so.16", "7.3.30/transfer-libs/libjpeg.so.8", "7.3.30/transfer-libs/libcurl.so.4", "7.3.30/transfer-libs/libfreetype.so.6", "7.3.30/transfer-libs/libicuio.so.67", "7.3.30/transfer-libs/libicui18n.so.67", "7.3.30/transfer-libs/libicuuc.so.67", "7.3.30/transfer-libs/libgcc_s.so.1", "7.3.30/transfer-libs/libxml2.so.2", "7.3.30/transfer-libs/libxslt.so.1", "7.3.30/transfer-libs/libgcrypt.so.20", "7.3.30/transfer-libs/libnghttp2.so.14", "7.3.30/transfer-libs/libbz2.so.1", "7.3.30/transfer-libs/libicudata.so.67", "7.3.30/transfer-libs/libgpg-error.so.0", "7.3.30/transfer-libs/libzip.so.5", "7.3.30/transfer-libs/liblzma.so.5", "/usr/lib/"]

RUN apk update \
    && apk add shadow \
    && useradd -u ${USER_ID} -g www-data -d /var/www www-data -s /bin/sh -M \
    && mkdir -p /var/www/html \
    && rm -Rf /var/cache/apk 

VOLUME /var/www/html /var/log/php /opt/php/var/log /var/www/.ssh

EXPOSE 9000 9001

CMD ["php-fpm", "-c", "/opt/php/fpm", "-F"]
