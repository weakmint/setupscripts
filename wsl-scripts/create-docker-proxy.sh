#!/bin/bash

# build the relay
echo "Building docker relay..."

go get -d github.com/jstarks/npiperelay
GOOS=windows go build -o /mnt/c/Users/$WIN_USER/go/bin/npiperelay.exe github.com/jstarks/npiperelay

sudo ln -s /mnt/c/Users/$WIN_USER/go/bin/npiperelay.exe /usr/local/bin/npiperelay.exe

sudo apt-get install -y socat

# create WSL-side linux script
echo "Creating script to communicate with relay..."

if [ ! -f ~/docker-relay ]
	then
		cat <<EOF > ~/docker-relay
#!/bin/bash
exec socat UNIX-LISTEN:/var/run/docker.sock,fork,group=docker,umask=007 EXEC:"npiperelay.exe -ep -s //./pipe/docker_engine",nofork
EOF

fi

chmod +x ~/docker-relay
