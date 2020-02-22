# JupyterLab

The repository provides a scaffold for building a Docker image for running
[JupyterLab].

## Local

### Installation

```sh
# Build a Docker image:
make build

# Create an alias for convenience:
make alias
```

### Usage

```sh
# Go to an arbitrary directory:
cd /path/to/some/project

# Start the container:
jupyterlab
```

## Cloud

### Installation

```sh
# Build a Docker image and push to Container Registry:
make -f Makefile.cloud build

# Create an alias `jupyterlab` for convenience:
make -f Makefile.cloud alias
```

### Usage

```sh
# Create a virtual machine in Compute Engine:
jupyterlab create

# Start the machine and connect via SSH with port forwarding:
jupyterlab start

# Open the web interface:
open http://localhost:8080

# Stop the machine:
jupyterlab stop

# Delete the machine:
jupyterlab delete
```

[JupyterLab]: https://github.com/jupyterlab/jupyterlab
