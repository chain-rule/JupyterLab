# Start with a Python image
FROM python:3.7.7-slim

# Install Python packages
COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip
RUN pip install --upgrade --requirement /tmp/requirements.txt

# Configure JupyterLab
COPY .jupyter /root/.jupyter

WORKDIR /home/jupyterlab

ENTRYPOINT jupyter lab --allow-root --no-browser
