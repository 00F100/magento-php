.PHONY: install alpine-php-cli-fpm-7-23-8 alpine-php-cli-fpm-7-2-21 alpine-php-cli-fpm-7-1-30 alpine-php-cli-fpm-7-0-33

alpine-php-cli-fpm-7-3-8:
	docker image build --build-arg USER_ID=$(shell id -u) --build-arg PHP_VERSION=7.3.8 -t 00f100/magento-php:temp alpine;
	mkdir -p $(PWD)/alpine/7.3.8/transfer-data;
	mkdir -p $(PWD)/alpine/7.3.8/transfer-libs;
	docker volume create \
	    --driver local \
	    --opt type=none \
	    --opt device=$(PWD)/alpine/7.3.8/transfer-data \
	    --opt o=bind \
	    transfer_data;
	docker volume create \
	    --driver local \
	    --opt type=none \
	    --opt device=$(PWD)/alpine/7.3.8/transfer-libs \
	    --opt o=bind \
	    transfer_libs;
	docker container run --rm -v transfer_data:/opt/php -v transfer_libs:/usr/lib 00f100/magento-php:temp sh -c "sleep 1; echo \"Copy to volume finish\"";
	docker build --build-arg USER_ID=$(shell id -u) -t 00f100/magento-php-cli:7.3.8-alpine -f alpine/7.3.8/cli/Dockerfile alpine
	docker build --build-arg USER_ID=$(shell id -u) -t 00f100/magento-php-fpm:7.3.8-alpine -f alpine/7.3.8/fpm/Dockerfile alpine
	docker rmi 00f100/magento-php:temp;
	docker volume rm transfer_data;
	docker volume rm transfer_libs;
	sudo rm -Rf $(PWD)/alpine/7.3.8/transfer-data
	sudo rm -Rf $(PWD)/alpine/7.3.8/transfer-libs

alpine-php-cli-fpm-7-2-21:
	docker image build --build-arg USER_ID=$(shell id -u) --build-arg PHP_VERSION=7.2.21 -t 00f100/magento-php:temp alpine;
	mkdir -p $(PWD)/alpine/7.2.21/transfer-data;
	mkdir -p $(PWD)/alpine/7.2.21/transfer-libs;
	docker volume create \
	    --driver local \
	    --opt type=none \
	    --opt device=$(PWD)/alpine/7.2.21/transfer-data \
	    --opt o=bind \
	    transfer_data;
	docker volume create \
	    --driver local \
	    --opt type=none \
	    --opt device=$(PWD)/alpine/7.2.21/transfer-libs \
	    --opt o=bind \
	    transfer_libs;
	docker container run --rm -v transfer_data:/opt/php -v transfer_libs:/usr/lib 00f100/magento-php:temp sh -c "sleep 1; echo \"Copy to volume finish\"";
	docker build --build-arg USER_ID=$(shell id -u) -t 00f100/magento-php-cli:7.2.21-alpine -f alpine/7.2.21/cli/Dockerfile alpine
	docker build --build-arg USER_ID=$(shell id -u) -t 00f100/magento-php-fpm:7.2.21-alpine -f alpine/7.2.21/fpm/Dockerfile alpine
	docker rmi 00f100/magento-php:temp;
	docker volume rm transfer_data;
	docker volume rm transfer_libs;
	sudo rm -Rf $(PWD)/alpine/7.2.21/transfer-data
	sudo rm -Rf $(PWD)/alpine/7.2.21/transfer-libs

alpine-php-cli-fpm-7-1-30:
	docker image build --build-arg USER_ID=$(shell id -u) --build-arg PHP_VERSION=7.1.30 -t 00f100/magento-php:temp alpine;
	mkdir -p $(PWD)/alpine/7.1.30/transfer-data;
	mkdir -p $(PWD)/alpine/7.1.30/transfer-libs;
	docker volume create \
	    --driver local \
	    --opt type=none \
	    --opt device=$(PWD)/alpine/7.1.30/transfer-data \
	    --opt o=bind \
	    transfer_data;
	docker volume create \
	    --driver local \
	    --opt type=none \
	    --opt device=$(PWD)/alpine/7.1.30/transfer-libs \
	    --opt o=bind \
	    transfer_libs;
	docker container run --rm -v transfer_data:/opt/php -v transfer_libs:/usr/lib 00f100/magento-php:temp sh -c "sleep 1; echo \"Copy to volume finish\"";
	docker build --build-arg USER_ID=$(shell id -u) -t 00f100/magento-php-cli:7.1.30-alpine -f alpine/7.1.30/cli/Dockerfile alpine
	docker build --build-arg USER_ID=$(shell id -u) -t 00f100/magento-php-fpm:7.1.30-alpine -f alpine/7.1.30/fpm/Dockerfile alpine
	docker rmi 00f100/magento-php:temp;
	docker volume rm transfer_data;
	docker volume rm transfer_libs;
	sudo rm -Rf $(PWD)/alpine/7.1.30/transfer-data
	sudo rm -Rf $(PWD)/alpine/7.1.30/transfer-libs

alpine-php-cli-fpm-7-0-33:
	docker image build --build-arg USER_ID=$(shell id -u) --build-arg PHP_VERSION=7.0.33 -t 00f100/magento-php:temp alpine;
	mkdir -p $(PWD)/alpine/7.0.33/transfer-data;
	mkdir -p $(PWD)/alpine/7.0.33/transfer-libs;
	docker volume create \
	    --driver local \
	    --opt type=none \
	    --opt device=$(PWD)/alpine/7.0.33/transfer-data \
	    --opt o=bind \
	    transfer_data;
	docker volume create \
	    --driver local \
	    --opt type=none \
	    --opt device=$(PWD)/alpine/7.0.33/transfer-libs \
	    --opt o=bind \
	    transfer_libs;
	docker container run --rm -v transfer_data:/opt/php -v transfer_libs:/usr/lib 00f100/magento-php:temp sh -c "sleep 1; echo \"Copy to volume finish\"";
	docker build --build-arg USER_ID=$(shell id -u) -t 00f100/magento-php-cli:7.0.33-alpine -f alpine/7.0.33/cli/Dockerfile alpine
	docker build --build-arg USER_ID=$(shell id -u) -t 00f100/magento-php-fpm:7.0.33-alpine -f alpine/7.0.33/fpm/Dockerfile alpine
	docker rmi 00f100/magento-php:temp;
	docker volume rm transfer_data;
	docker volume rm transfer_libs;
	sudo rm -Rf $(PWD)/alpine/7.0.33/transfer-data
	sudo rm -Rf $(PWD)/alpine/7.0.33/transfer-libs