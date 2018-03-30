name ?= jupyterlab
root ?= ${PWD}

alias:
	@echo "alias ${name}='make -f \"${PWD}/Makefile\" root=\"\$${PWD}\" start'" >> ~/.bash_profile

image:
	docker rmi ${name} || true
	docker build -t ${name} .

start:
	@docker run \
		--interactive \
		--tty \
		--rm \
		--name ${name} \
		-v "${root}:/home/${name}" \
		-w "/home/${name}" \
		-p 8888:8888 \
		${name}

.PHONY: alias image start
