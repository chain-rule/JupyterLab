# The name of the image
name ?= jupyterlab
# The root directory to be mounted to the container
root ?= ${PWD}

all: start

# Create an alias for starting a new container
alias:
	echo "alias ${name}='make -C \"${PWD}\" root=\"\$${PWD}\"'" >> ~/.$(if ${ZSH_NAME},bash,zsh)rc

# Build a new image
build:
	docker rmi ${name} || true
	docker build --tag ${name} .

# Start a new container
start:
	@docker run --interactive --tty --rm --name ${name} \
		--volume "${root}:/home/${name}" \
		--workdir "/home/${name}" \
		--publish 8888:8888 \
		${name}

# Start a shell in a running container
shell:
	@docker exec --interactive --tty ${name} /bin/bash

.PHONY: all alias build start shell
