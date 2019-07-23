# The name of the Docker image
name := jupyterlab
# The directory to be mounted to the container
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
	@docker run --interactive --tty --rm \
		--name ${name} \
		--publish 8888:8888 \
		--volume "${root}:/home/jupyterlab" \
		${name}

# Start a shell in a running container
shell:
	@docker exec --interactive --tty ${name} /bin/bash

.PHONY: all alias build start shell
