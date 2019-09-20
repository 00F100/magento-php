### PHP 7.1.31 + Composer 1.9.0 + NPM 6.9.0

##### Simple use:
```
$ docker run -it --rm --user www-data -v /path/to/your-dir:/var/www/html 00f100/magento-php-cli:7.1.31-ubuntu
```

##### Custom php.ini
```
$ docker run -it --rm --user www-data -v path/to/php.ini:/opt/php/lib/php.ini -v /path/to/your-dir:/var/www/html 00f100/magento-php-cli:7.1.31-ubuntu
```

##### Build image

> Rebuild image of magento-php-cli:7.1.31-ubuntu in your localhost.

> This process uses UID of your user, fixing `permissions write error` into container execution.

```
$ git clone git@github.com:00F100/magento-php.git
$ cd magento-php
$ make ubuntu-php-cli-fpm-7-1-31