# Install brew command, when needed
brew --version
if [ $? != 0 ] ; then
    echo 'ℹ️  First install "brew" command'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install colima command, when needed
colima --version
if [ $? != 0 ] ; then
    echo 'ℹ️  First install "colima" command'
    brew install colima
fi

# Install docker command, when needed
docker --version
if [ $? != 0 ] ; then
    echo 'ℹ️  First install "docker" command'
    brew install docker docker-compose
fi

# Install buildx
echo 'Installing buildx...'
brew install docker-buildx
mkdir ~/.docker/cli-plugins
ln -sfn $(which docker-buildx) ~/.docker/cli-plugins/docker-buildx
docker buildx install
docker buildx version # verify installation