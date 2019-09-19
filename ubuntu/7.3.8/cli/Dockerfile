FROM ubuntu:18.04

ARG USER_ID=1000

ENV PATH "/opt/php/bin:/opt/php/sbin:$PATH"

COPY 7.3.8/transfer-data /opt/php
COPY ["7.3.8/transfer-libs/libzip.so.4", "7.3.8/transfer-libs/libexslt.so.0", "7.3.8/transfer-libs/libpng16.so.16", "7.3.8/transfer-libs/libjpeg.so.8", "7.3.8/transfer-libs/libxml2.so.2", "7.3.8/transfer-libs/libssl.so.1.1", "7.3.8/transfer-libs/libcrypto.so.1.1", "7.3.8/transfer-libs/libcrypto.so.1.1", "7.3.8/transfer-libs/libcurl.so.4", "7.3.8/transfer-libs/libfreetype.so.6", "7.3.8/transfer-libs/libicuio.so.60", "7.3.8/transfer-libs/libicui18n.so.60", "7.3.8/transfer-libs/libicuuc.so.60", "7.3.8/transfer-libs/libxslt.so.1", "7.3.8/transfer-libs/libnghttp2.so.14", "7.3.8/transfer-libs/librtmp.so.1", "7.3.8/transfer-libs/libpsl.so.5", "7.3.8/transfer-libs/libgssapi_krb5.so.2", "7.3.8/transfer-libs/libldap_r-2.4.so.2", "7.3.8/transfer-libs/liblber-2.4.so.2", "7.3.8/transfer-libs/libicudata.so.60", "7.3.8/transfer-libs/libkrb5.so.3", "7.3.8/transfer-libs/libk5crypto.so.3", "7.3.8/transfer-libs/libsasl2.so.2", "7.3.8/transfer-libs/libkrb5support.so.0", "7.3.8/transfer-libs/libgssapi.so.3", "7.3.8/transfer-libs/libheimntlm.so.0", "7.3.8/transfer-libs/libkrb5.so.26", "7.3.8/transfer-libs/libasn1.so.8", "7.3.8/transfer-libs/libhcrypto.so.4", "7.3.8/transfer-libs/libroken.so.18", "7.3.8/transfer-libs/libwind.so.0", "7.3.8/transfer-libs/libheimbase.so.1", "7.3.8/transfer-libs/libhx509.so.5", "7.3.8/transfer-libs/libsqlite3.so.0", "/usr/lib/x86_64-linux-gnu/"]
COPY ["7.3.8/transfer-libs2/libkeyutils.so.1", "/lib/x86_64-linux-gnu/"]

RUN apt-get update \
    && apt-get install curl git -y \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install nodejs -y \
    && npm i -g npm@6.9.0 grunt \
    && mkdir -p /var/www/html \
    && deluser www-data \
    && useradd -u ${USER_ID} -d /var/www www-data -s /bin/sh -M \
    && cd ~ \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && chown -R www-data:www-data /var/www \
    && echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf \
    && apt-get autoremove \
    && rm -Rf /var/cache/apt \
    && echo 'PS1="┌───────────────────\n│[\033[0;31m\e[1m\u\e[0m\033[0m]@[\e[34mphp 7.3.8\033[0m][\e[34mcomposer 1.9.0\033[0m][\e[34mnpm 6.9.0\033[0m]\n│[\[\e[32m\]\w\[\e[0m\]]\n└─╼ "' >> /root/.bashrc

VOLUME /var/www/html /var/log/php /opt/php/var/log /var/www/.composer /var/www/.ssh

WORKDIR /var/www/html   
