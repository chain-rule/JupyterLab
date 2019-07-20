FROM python:3.7-slim

RUN apt-get update
RUN apt-get install -y curl

COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip
RUN pip install --upgrade --requirement /tmp/requirements.txt
RUN mkdir -p ~/.jupyter
RUN echo "c.NotebookApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.port = 8888" >> ~/.jupyter/jupyter_notebook_config.py

CMD jupyter lab --allow-root
