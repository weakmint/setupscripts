#!/bin/bash

# get the versions for packages we're going ot install
source ./variables.sh

# run the correct scripts folder based on distro
DISTRO=""
if [ "$(lsb_release -d | grep Ubuntu)" ]
	then
		DISTRO="ubuntu"	
fi

# confirm we have found the distro
if [ -z $DISTRO ]
	then
		echo "Unable to determine distro!"
		exit 1
fi

# run the scripts for the distro
for f in ./$DISTRO-scripts/*.sh; do
	echo "Running $f"
	source $f
done

# check if we're on WSL
if [ "$(uname -a | grep Microsoft)" ]
	then
		for f in ./wsl-scripts/*.sh; do
			echo "Running $f"
			source $f
		done
fi

# sourcing .profile to update path
source ~/.profile
