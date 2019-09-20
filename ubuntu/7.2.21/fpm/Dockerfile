FROM ubuntu:18.04

ARG USER_ID=1000

ENV PATH "/opt/php/bin:/opt/php/sbin:$PATH"

COPY 7.2.21/transfer-data /opt/php
COPY ["7.2.21/transfer-libs/libzip.so.4", "7.2.21/transfer-libs/libexslt.so.0", "7.2.21/transfer-libs/libpng16.so.16", "7.2.21/transfer-libs/libjpeg.so.8", "7.2.21/transfer-libs/libxml2.so.2", "7.2.21/transfer-libs/libssl.so.1.1", "7.2.21/transfer-libs/libcrypto.so.1.1", "7.2.21/transfer-libs/libcrypto.so.1.1", "7.2.21/transfer-libs/libcurl.so.4", "7.2.21/transfer-libs/libfreetype.so.6", "7.2.21/transfer-libs/libicuio.so.60", "7.2.21/transfer-libs/libicui18n.so.60", "7.2.21/transfer-libs/libicuuc.so.60", "7.2.21/transfer-libs/libxslt.so.1", "7.2.21/transfer-libs/libnghttp2.so.14", "7.2.21/transfer-libs/librtmp.so.1", "7.2.21/transfer-libs/libpsl.so.5", "7.2.21/transfer-libs/libgssapi_krb5.so.2", "7.2.21/transfer-libs/libldap_r-2.4.so.2", "7.2.21/transfer-libs/liblber-2.4.so.2", "7.2.21/transfer-libs/libicudata.so.60", "7.2.21/transfer-libs/libkrb5.so.3", "7.2.21/transfer-libs/libk5crypto.so.3", "7.2.21/transfer-libs/libsasl2.so.2", "7.2.21/transfer-libs/libkrb5support.so.0", "7.2.21/transfer-libs/libgssapi.so.3", "7.2.21/transfer-libs/libheimntlm.so.0", "7.2.21/transfer-libs/libkrb5.so.26", "7.2.21/transfer-libs/libasn1.so.8", "7.2.21/transfer-libs/libhcrypto.so.4", "7.2.21/transfer-libs/libroken.so.18", "7.2.21/transfer-libs/libwind.so.0", "7.2.21/transfer-libs/libheimbase.so.1", "7.2.21/transfer-libs/libhx509.so.5", "7.2.21/transfer-libs/libsqlite3.so.0", "/usr/lib/x86_64-linux-gnu/"]
COPY ["7.2.21/transfer-libs2/libkeyutils.so.1", "/lib/x86_64-linux-gnu/"]

RUN mkdir -p /var/www/html \
    && deluser www-data \
    && useradd -u ${USER_ID} -d /var/www www-data -s /bin/bash -M \
    && rm -Rf /var/cache/apt 

VOLUME /var/www/html /var/log/php /opt/php/var/log /var/www/.ssh

EXPOSE 9000 9001

CMD ["php-fpm", "-c", "/opt/php/fpm", "-F"]