#!/bin/bash

#RUN:
#bash ~/my_bin/install_docker_compose.sh

sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

mkdir -p ~/.zsh/completion
curl -L https://raw.githubusercontent.com/docker/compose/1.21.0/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose

docker-compose --version

echo "Intalled docker-compose"
