### PHP FPM 7.1.31

| Port | Use |
|---|---|
| 9000 | XDebug |
| 9001 | PHP FPM |

##### Simple use:
```
$ docker run -d --rm --user www-data -v path/to:/opt/php/fpm/php.ini -v path/to:/opt/php/etc/php-fpm.conf -v path/to:/opt/php/etc/php-fpm.d/www.conf -v path/to:/var/www/html -p 9000:9000 -p 9001:9001 -v /path/to/your-dir:/var/www/html 00f100/magento-php-fpm:7.1.31-alpine
```

##### Custom php.ini
```
$ docker run -d --rm --user www-data -v path/to:/opt/php/fpm/php.ini -v path/to:/opt/php/etc/php-fpm.conf -v path/to:/opt/php/etc/php-fpm.d/www.conf -v path/to:/var/www/html -p 9000:9000 -p 9001:9001 -v path/to/php.ini:/opt/php/lib/php.ini -v /path/to/your-dir:/var/www/html 00f100/magento-php-fpm:7.1.31-alpine
```

##### Build image

> Rebuild image of magento-php-fpm:7.1.31-alpine in your localhost.

> This process uses UID of your user, fixing `permissions write error` into container execution.

```
$ git clone git@github.com:00F100/magento-php.git
$ cd magento-php
$ make alpine-php-cli-fpm-7-1-31
```

![](console.png)