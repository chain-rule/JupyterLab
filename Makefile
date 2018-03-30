name ?= jupyterlab
root ?= ${PWD}

alias:
	@echo "alias ${name}='make -f \"${PWD}/Makefile\" root=\"\$${PWD}\" start'" >> ~/.bash_profile

image:
	docker rmi ${name} || true
	docker build --tag ${name} .

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

.PHONY: alias image start
