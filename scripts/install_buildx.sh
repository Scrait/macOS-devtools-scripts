#!/bin/bash

# Create a folder who contains downloaded things for the setup
INSTALL_FOLDER=~/.macinsttools
mkdir -p $INSTALL_FOLDER
MAC_SETUP_PROFILE=$INSTALL_FOLDER/macsetup_profile

# Install brew command, when needed
if ! hash brew
then
    echo 'ℹ️ Install "brew" command'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew update
    brew --version # verify installation
else
  printf "\e[93m%s\e[m\n" "You already have brew installed."
fi

# Install colima command, when needed
if ! hash colima
then
    echo 'ℹ️ Install "colima" command'
    brew install colima
    colima --version # verify installation
else
    printf "\e[93m%s\e[m\n" "You already have colima installed."
fi
colima restart

# Install docker/docker-compose command, when needed
if ! hash docker
then
    echo 'ℹ️ Install "docker" command'
    brew install docker docker-compose
    docker --version # verify installation
    docker-compose --version # verify installation
else
    printf "\e[93m%s\e[m\n" "You already have docker/docker-compose installed."
fi

# Install buildx
echo 'ℹ️ Installing buildx...'
brew install docker-buildx
mkdir ~/.docker/cli-plugins
ln -sfn $(which docker-buildx) ~/.docker/cli-plugins/docker-buildx
docker buildx install
docker buildx version # verify installation