NAME ?= aooj/php7-apache
VERSION ?= 0.0.1

build:
	docker build --rm -t ${NAME}:${VERSION} .