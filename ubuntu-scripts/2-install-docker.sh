#! /bin/bash

echo "Installing Docker dependencies..."
sudo apt-get -y install \
	apt-transport-https \
	ca-certificates \
	curl \
	software-properties-common

echo "Adding Docker key to apt..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# TODO - Validate the key is correct

echo "Adding Docker repository to sources..."
sudo add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable"

echo "Installing Docker CE..."
sudo apt-get update && sudo apt-get install -y docker-ce

echo "adding user to docker group"
sudo usermod -aG $USER docker
