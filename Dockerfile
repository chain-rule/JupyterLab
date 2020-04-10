# Start with a Python image
FROM python:3.7.6-slim

# Install Python packages
COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip
RUN pip install --upgrade --requirement /tmp/requirements.txt

# Configure JupyterLab
RUN mkdir -p ~/.jupyter
RUN echo "c.NotebookApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.port = 8888" >> ~/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.token = ''" >> ~/.jupyter/jupyter_notebook_config.py

WORKDIR /home/jupyterlab

ENTRYPOINT jupyter lab --allow-root --no-browser
