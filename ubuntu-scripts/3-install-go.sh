#!/bin/bash

echo "Installing golang version $GO_VERSION"
sudo wget https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz -O archives/go$GO_VERSION.linux-amd64.tar.gz

sudo tar -C /usr/local -xzf archives/go$GO_VERSION.linux-amd64.tar.gz

echo "Adding golang bin dir to path..."
if [ -n "$(cat ~/.profile | grep PATH:/usr/local/go/bin)" ]
	then
		exit 0;
	else
		echo 'PATH=$PATH:/usr/local/go/bin # Add go bin to path' >> ~/.profile 	
fi
