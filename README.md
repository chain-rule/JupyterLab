# JupyterLab

The repository provides a scaffold for building a Docker image for running
[JupyterLab].

## Local

### Installation

```sh
# Build a Docker image:
make build

# Create an alias for convenience:
make alias >> ~/.zshrc
```

### Usage

```sh
# Go to an arbitrary directory:
cd /path/to/some/project

# Start a container:
jupyterlab
```

## Cloud

### Installation

```sh
# Build a Docker image and push to Container Registry:
make -f Makefile.cloud build

# Create an alias for convenience:
make -f Makefile.cloud alias >> ~/.zshrc
```

### Usage

```sh
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

[JupyterLab]: https://github.com/jupyterlab/jupyterlab
