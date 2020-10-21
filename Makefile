SHELL := /bin/bash

start:
	docker-compose up -d
	symfony server:start -d
	# symfony run -d --watch=config,src,templates,vendor symfony console messenger:consume async
	# symfony console messenger:consume async -vv
.PHONY: start

stop:
	docker-compose down
	symfony server:stop
.PHONY: stop

tests:
	symfony console doctrine:fixtures:load -n
	symfony php bin/phpunit
.PHONY: tests