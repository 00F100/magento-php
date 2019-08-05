.PHONY: install

alpine-php-cli-fpm-7-2-20:
	docker image build --build-arg USER_ID=$(shell id -u) --build-arg PHP_VERSION=7.2.20 -t 00f100/magento-php:temp alpine;
	docker volume rm transfer_data;
	docker volume rm transfer_libs;
	mkdir -p $(PWD)/alpine/7.2.20/transfer-data;
	mkdir -p $(PWD)/alpine/7.2.20/transfer-libs;
	docker volume create \
	    --driver local \
	    --opt type=none \
	    --opt device=$(PWD)/alpine/7.2.20/transfer-data \
	    --opt o=bind \
	    transfer_data;
	docker volume create \
	    --driver local \
	    --opt type=none \
	    --opt device=$(PWD)/alpine/7.2.20/transfer-libs \
	    --opt o=bind \
	    transfer_libs;
	docker container run --rm -v transfer_data:/opt/php -v transfer_libs:/usr/lib 00f100/magento-php:temp sh -c "sleep 2; echo \"Finish\"";
	sudo rm -Rf alpine/7.2.20/transfer_data/bin/php-cgi
	sudo rm -Rf alpine/7.2.20/transfer_data/bin/phpdbg
	sudo rm -Rf alpine/7.2.20/transfer_data/lib/php/doc
	sudo rm -Rf alpine/7.2.20/transfer_data/php/man
	docker build --build-arg USER_ID=$(shell id -u) -t 00f100/magento-php-cli:7.2.20-alpine -f alpine/7.2.20/cli/Dockerfile alpine
	docker build --build-arg USER_ID=$(shell id -u) -t 00f100/magento-php-fpm:7.2.20-alpine -f alpine/7.2.20/fpm/Dockerfile alpine
	docker rmi 00f100/magento-php:temp;
	docker volume rm transfer_data;
	docker volume rm transfer_libs;
	sudo rm -Rf $(PWD)/alpine/7.2.20/transfer-data
	sudo rm -Rf $(PWD)/alpine/7.2.20/transfer-libs
