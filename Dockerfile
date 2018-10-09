FROM tensorflow/tensorflow:latest-py3

COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /tmp/requirements.txt

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager

CMD ["jupyter", "lab", "--allow-root"]
