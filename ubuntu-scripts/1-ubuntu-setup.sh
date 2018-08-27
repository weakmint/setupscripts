#! /bin/bash
echo "Add the multiverse repo"
sudo add-apt-repository multiverse

echo "Getting latest packages..."
sudo apt-get update && sudo apt-get upgrade -y

printf "Installing apt packages (non-gui):\n\
  git\n\
  build-essential"
sudo apt-get install -y \
git \
build-essential

if [ "$(ps -e | grep Xorg)" ]
    printf "Installing apt packages (gui):\n\"
  terminator\n\
  numix-gtk-theme\n\
  numix-icon-theme\n\
  steam"
    sudo apt-get install -y \
    terminator \
    numix-gtk-theme \
    numix-icon-theme \
    steam
fi

printf "Installing snaps:\n\
  slack\n\
  vscode"
sudo snap install --classic \
slack 
sudo snap install vscode
