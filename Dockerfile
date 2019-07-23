# Start with a minimal Python image
FROM python:3.7-slim

# Install the desired Python packages
COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip
RUN pip install --upgrade --requirement /tmp/requirements.txt

# Configure JupyterLab to use a specific IP address and port
RUN mkdir -p ~/.jupyter
RUN echo "c.NotebookApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.port = 8888" >> ~/.jupyter/jupyter_notebook_config.py

# Set the working directory
WORKDIR /home/jupyterlab

# Stort JupyterLab once the container is launched
ENTRYPOINT jupyter lab --allow-root --no-browser
