name ?= jupyterlab
root ?= ${PWD}

all: start

build:
	docker rmi ${name} || true
	docker build --tag ${name} .

link:
	echo "alias ${name}='make -f \"${PWD}/Makefile\" root=\"\$${PWD}\"'" >> ~/.bash_profile

shell:
	docker exec \
		--interactive \
		--tty \
		${name} \
		/bin/bash

start:
	@docker run \
		--interactive \
		--name ${name} \
		--publish 8888:8888 \
		--rm \
		--tty \
		--volume "${root}:/home/${name}" \
		--workdir "/home/${name}" \
		${name}

.PHONY: all build link shell start
