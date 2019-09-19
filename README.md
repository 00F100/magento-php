# Magento PHP - Docker

All images have UID=1000

If you have different, please build a local image.

## Versions PHP

| SO | PHP CLI + Composer + NPM | PHP FPM |
|---|---|---|
| Alpine | [`7.3.8`](alpine/7.3.8/cli), [`7.2.21`](alpine/7.2.21/cli), [`7.1.30`](alpine/7.1.30/cli), [`7.0.33`](alpine/7.0.33/cli) | [`7.3.8`](alpine/7.3.8/fpm), [`7.2.21`](alpine/7.2.21/fpm), [`7.1.30`](alpine/7.1.30/fpm), [`7.0.33`](alpine/7.0.33/fpm) |

## Versions Others

| Application | Version |
|---|---|
| Nginx | [`1.17.3`](https://hub.docker.com/_/nginx) |
| MySQL | [`5.7.27`](https://hub.docker.com/_/mysql) |