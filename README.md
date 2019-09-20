# Magento PHP - Docker

All images have UID=1000

If you have different, please [build a local image](#build-local-image).

To view your UID execute: `$ id -u`

## Versions PHP

| SO | PHP CLI + Composer + NPM | PHP FPM |
|---|---|---|
| Alpine | [`7.3.8`](alpine/7.3.8/cli), [`7.2.21`](alpine/7.2.21/cli), [`7.1.31`](alpine/7.1.31/cli), [`7.0.33`](alpine/7.0.33/cli) | [`7.3.8`](alpine/7.3.8/fpm), [`7.2.21`](alpine/7.2.21/fpm), [`7.1.31`](alpine/7.1.31/fpm), [`7.0.33`](alpine/7.0.33/fpm) |
| Ubuntu | [`7.3.8`](ubuntu/7.3.8/cli), [`7.2.21`](ubuntu/7.2.21/cli), [`7.1.31`](ubuntu/7.1.31/cli), [`7.0.33`](ubuntu/7.0.33/cli) | [`7.3.8`](ubuntu/7.3.8/fpm), [`7.2.21`](ubuntu/7.2.21/fpm), [`7.1.31`](ubuntu/7.1.31/fpm), [`7.0.33`](ubuntu/7.0.33/fpm) |

## Build local image

#### Alpine 3.10

| PHP Version | Command |
|---|---|
| `7.3.8` | `$ make alpine-php-cli-fpm-7-3-8` |
| `7.2.21` | `$ make alpine-php-cli-fpm-7-2-21` |
| `7.1.31` | `$ make alpine-php-cli-fpm-7-1-31` |
| `7.0.33` | `$ make alpine-php-cli-fpm-7-0-33` |

#### Ubuntu 18.04

| PHP Version | Command |
|---|---|
| `7.3.8` | `$ make ubuntu-php-cli-fpm-7-3-8` |
| `7.2.21` | `$ make ubuntu-php-cli-fpm-7-2-21` |
| `7.1.31` | `$ make ubuntu-php-cli-fpm-7-1-31` |
| `7.0.33` | `$ make ubuntu-php-cli-fpm-7-0-33` |