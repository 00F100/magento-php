### PHP FPM 7.2.20 + Composer 1.9.0 + NPM 6.9.0

##### Simple use:
```
$ docker run -d --rm --user www-data -p 9000:9000 -p 9001:9001 -v /path/to/your-dir:/var/www/html 00f100/magento-php-fpm:7.2.20-alpine
```

##### Custom php.ini
```
$ docker run -d --rm --user www-data -p 9000:9000 -p 9001:9001 -v path/to/php.ini:/opt/php/lib/php.ini -v /path/to/your-dir:/var/www/html 00f100/magento-php-fpm:7.2.20-alpine
```

##### Build image

> Rebuild image of magento-php-fpm:7.2.20-alpine in your localhost.

> This process uses UID of your user, fixing `permissions write error` into container execution.

```
$ git clone git@github.com:00F100/magento-php.git
$ cd magento-php
$ make alpine-php-cli-fpm-7-2-20
```

![](console.png)