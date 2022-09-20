# JupyterLab

The repository provides a scaffold for building a Docker image for running
[JupyterLab].

## Local

### Installation

```shell
# Build a Docker image:
make build

# Create an alias for convenience:
make alias >> ~/.zshrc
```

### Usage

```shell
# Go to an arbitrary directory:
cd /path/to/some/project

# Start a container:
jupyterlab
```

## Cloud

### Installation

```shell
# Build a Docker image and push to Container Registry:
make -f Makefile.cloud build

# Create an alias for convenience:
make -f Makefile.cloud alias >> ~/.zshrc
```

### Usage

```shell
# Create a virtual machine in Compute Engine:
jupyterlab create

# Start the machine:
jupyterlab start

# Open a shell:
jupyterlab shell

# Open the web interface:
open http://localhost:8888

# Suspend the machine:
jupyterlab suspend

# Resume the machine:
jupyterlab resume

# Stop the machine:
jupyterlab stop

# Delete the machine:
jupyterlab delete
```

## Vertex AI

### Installation

```shell
git clone https://github.com/chain-rule/JupyterLab.git ~/.jupyterlab && make -f ~/.jupyterlab/Makefile.vertex
```

### Usage

```shell
# Start the machine:
jupyterlab start

# Open a shell:
jupyterlab shell

# Open the web interface:
open http://localhost:8080

# Suspend the machine:
jupyterlab suspend

# Resume the machine:
jupyterlab resume

# Stop the machine:
jupyterlab stop
```

[JupyterLab]: https://github.com/jupyterlab/jupyterlab
