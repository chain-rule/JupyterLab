name ?= jupyterlab
root ?= ${PWD}

build:
	docker rmi ${name} || true
	docker build --tag ${name} .

link:
	echo "alias ${name}='make -f \"${PWD}/Makefile\" root=\"\$${PWD}\" start'" >> ~/.bash_profile

start:
	@docker run \
		--interactive \
		--tty \
		--rm \
		--name ${name} \
		--volume "${root}:/home/${name}" \
		--workdir "/home/${name}" \
		--publish 8888:8888 \
		${name}

.PHONY: build link start
