# Start with a Python image
FROM python:3.7.7-slim

# Install command-line tools
RUN apt-get update
RUN apt-get install -y build-essential curl git htop psmisc openssh-server tmux vim zsh

# Configure the command line
RUN git clone https://github.com/IvanUkhov/.development.git ~/.development && make -C ~/.development
RUN git clone https://github.com/IvanUkhov/.vim.git ~/.vim --recursive && make -C ~/.vim
RUN ssh-keygen -t ed25519 -N '' -f ~/.ssh/id_ed25519

# Install Python packages
COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip
RUN pip install --upgrade --requirement /tmp/requirements.txt

# Configure JupyterLab
COPY .jupyter /root/.jupyter

WORKDIR /home/jupyterlab

ENTRYPOINT jupyter lab --allow-root --no-browser
