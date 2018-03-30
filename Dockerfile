FROM tensorflow/tensorflow:latest-py3

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

CMD ["jupyter", "lab", "--allow-root"]
