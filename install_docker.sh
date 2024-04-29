#!/bin/bash

# Atualiza a lista de pacotes
sudo apt update

# Instala as dependências
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Adiciona a chave GPG oficial do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Adiciona o repositório oficial do Docker
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualiza novamente a lista de pacotes para incluir o repositório do Docker
sudo apt update

# Instala o Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Verifique se o Docker foi instalado com sucesso
sudo docker --version

# Adiciona seu usuário ao grupo docker para executar comandos Docker sem sudo
sudo usermod -aG docker $USER

# Iniciar automaticamente no boot
sudo systemctl enable docker

# Inicia o Docker
sudo systemctl start docker

# Verifique o status
sudo systemctl status docker
