# Start with a Python image
FROM python:3.9.9-slim

# Install command-line tools
RUN apt-get update
RUN apt-get install -y build-essential curl git htop psmisc openssh-server tmux vim zsh

RUN echo 'deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main' | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN apt-get update && apt-get install -y google-cloud-sdk

# Configure the command line
RUN git clone https://github.com/IvanUkhov/.development.git ~/.development && make -C ~/.development
RUN git clone https://github.com/IvanUkhov/.vim.git ~/.vim --recursive && make -C ~/.vim
RUN ssh-keygen -t ed25519 -N '' -f ~/.ssh/id_ed25519
RUN echo 'StrictHostKeyChecking no' >> ~/.ssh/config

# Install Python packages
COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip
RUN pip install --upgrade --requirement /tmp/requirements.txt

# Configure JupyterLab
COPY .jupyter /root/.jupyter

WORKDIR /home/jupyterlab

ENTRYPOINT jupyter lab --allow-root --no-browser
