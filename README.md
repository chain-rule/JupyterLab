# JupyterLab

The repository provides a scaffold for building a Docker image for running
[JupyterLab].

## Installation

Build a Docker image:

```sh
make build
```

Create an alias `jupyterlab` for starting a container:

```sh
make alias
```

Restart the shell.

## Usage

Go to an arbitrary directory and use the `jupyterlab` alias:

```sh
cd /path/to/some/project
jupyterlab
```

[JupyterLab]: https://github.com/jupyterlab/jupyterlab
