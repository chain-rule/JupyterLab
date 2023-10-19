# The name of the Docker image
name := jupyterlab
# The directory to be mounted to the container
root ?= ${PWD}

.PHONY: all
all: start

# Create an alias for starting a new container and one for a shell prompt
.PHONY: alias
alias:
	@echo "alias ${name}='make -C \"${PWD}\" root=\"\$${PWD}\"'"
	@echo "alias ${name}-shell='docker exec -it \$$(docker ps --format \"table {{.ID}}\" | tail -1) /bin/zsh'"

# Build a new image
.PHONY: build
build:
	docker build --tag ${name} .

# Start a new container
.PHONY: start
start:
	@docker run --interactive --tty --rm \
		--name ${name} \
		--publish 8888:8888 \
		--volume "${root}:/home/jupyterlab" \
		${name}

# Start a shell in a running container
.PHONY: shell
shell:
	@docker exec --interactive --tty ${name} /bin/bash
