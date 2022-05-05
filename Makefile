ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: lint pull push

lint:
	docker run --rm -e RUN_LOCAL=true -v $(ROOT_DIR):/tmp/lint github/super-linter:slim-v4

pull:
	git pull --tags --force

push:
	git push --tags