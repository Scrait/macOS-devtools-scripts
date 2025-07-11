#!/bin/bash

# Create a folder who contains downloaded things for the setup (IN FUTURE)
# INSTALL_FOLDER=~/.macsetup
# mkdir -p $INSTALL_FOLDER
# MAC_SETUP_PROFILE=$INSTALL_FOLDER/macsetup_profile

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install brew command, when needed
if ! hash brew
then
    echo 'ℹ️ First install "brew" command'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew update
    brew --version # verify installation
else
  printf "\e[93m%s\e[m\n" "You already have brew installed."
fi

# Install CURL / WGET
echo 'ℹ️ Install "CURL / WGET" command'
brew install curl
echo 'export PATH="/opt/homebrew/opt/curl/bin:$PATH"' >> ~/.zshrc
echo '✅ Done! Restart your terminal or source your ~/.zshrc to apply alias.'
curl --version # verify installation
brew install wget
wget --version # verify installation



# Install 7zip
echo '❇️ Install 7zip'
# Install sevenzip
echo 'ℹ️ Install sevenzip'
brew install sevenzip
# Install p7zip
echo 'ℹ️ Install p7zip'
brew install p7zip
7z | head -n 2 # verify installation


# Install all git tools
echo '❇️ Install git tools'

# Install git
echo 'ℹ️ Install git'
brew install git
git --version # verify installation
# Install git-secrets
echo 'ℹ️ Install git-secrets'
brew install git-secrets                                                                              # git hook to check if you are pushing aws secret (https://github.com/awslabs/git-secrets)
git secrets --version # verify installation




echo '🔷 Install terminal tools'

# Install all zsh tools
echo '❇️ Install zsh tools'
# Install zsh && zsh-completions
echo 'ℹ️ Install zsh and zsh-completions'
brew install zsh zsh-completions
echo '⚙️ Setupping zsh and zsh-completions'
# Giver rights
sudo chmod -R 755 /usr/local/share/zsh
sudo chown -R root:staff /usr/local/share/zsh
# Add completions into ~/.zshrc
echo '⚙️  Add completions into ~/.zshrc'
if ! grep -q "compinit" ~/.zshrc; then
  {
    echo ""
    echo "# Enable brew zsh completions"
    echo "if type brew &>/dev/null; then"
    echo "  FPATH=\$(brew --prefix)/share/zsh/site-functions:\$FPATH"
    echo "  autoload -Uz compinit"
    echo "  compinit"
    echo "fi"
  } >> ~/.zshrc
fi



# Install Alacritty
echo '❇️ Install alacritty'

# Install Alacritty
echo 'ℹ️ Install alacritty'
brew install --cask alacritty
# Install lsd
echo 'ℹ️ Install lsd'
brew install lsd
# Install font
echo 'ℹ️ Install FiraCode Nerd Font'
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
# Setup for lsd
echo '⚙️ Adding alias ls=lsd to ~/.zshrc...'
if ! grep -q "alias ls='lsd --color=auto'" ~/.zshrc 2>/dev/null; then
  echo "alias ls='lsd --color=auto'" >> ~/.zshrc
fi
# Updating Alacritty config
echo '📝 Updating Alacritty config with Nerd Font...'
CONFIG_DIR="$HOME/.config/alacritty"
CONFIG_FILE="$CONFIG_DIR/alacritty.yml"
mkdir -p "$CONFIG_DIR"
# Create or Upadate config
cat > "$CONFIG_FILE" <<EOF
font:
  normal:
    family: "FiraCode Nerd Font"
    style: Regular
  size: 14.0
EOF
echo '✅ Done! Restart your terminal or source your ~/.zshrc to apply alias.'
echo 'Also make sure Alacritty uses the updated config (usually auto-detects ~/.config/alacritty/alacritty.yml).'



# Install SpaceVim
echo '❇️ Install SpaceVim'

# Install neovim
echo 'ℹ️ Install neovim'
brew install neovim
# Install spacevim
echo 'ℹ️ Install spacevim'
curl -sLf https://spacevim.org/install.sh | bash
nvim --version # verify installation



# Install other cmd tools
echo '❇️ Install other cmd tools'
# Install bash completion
echo 'ℹ️ Install bash-completion'
brew install bash-completion
# Install tree
echo 'ℹ️ Install tree'
brew install tree
# Install z
echo 'ℹ️ Install z'
brew install z
# Install ctop
echo 'ℹ️ Install ctop'
brew install ctop



# Install all docker tools
echo '❇️ Install all docker tools'

# Install colima
echo 'ℹ️ Install "colima" command'
brew install colima
colima --version # verify installation
colima restart # restart to start docker

# Install docker/docker-compose
echo 'ℹ️ Install "docker/docker-compose" command'
brew install docker docker-compose
docker --version # verify installation
docker-compose --version # verify installation
# Install completions
echo 'ℹ️ Install completions'
brew install bash-completion
brew install docker-completion
brew install docker-compose-completion
brew install docker-machine-completion

# Install kubernetes
echo 'ℹ️ Install "kubectl" command'
brew install kubectl
kubectl version # verify installation

# Install kompose
echo 'ℹ️ Install "kompose" command'
brew install kompose
kompose version # verify installation

# Install buildx
echo 'ℹ️ Installing buildx...'
brew install docker-buildx
echo '⚙️ Mooving buildx...'
mkdir ~/.docker/cli-plugins
ln -sfn $(which docker-buildx) ~/.docker/cli-plugins/docker-buildx
docker buildx install
docker buildx version # verify installation



# Install browsers
echo '❇️ Install browsers'

# Install google-chrome
echo 'ℹ️ Install google-chrome'
brew install --cask google-chrome
# Install tor
echo 'ℹ️ Install tor'
brew install tor



# Install IDEs
echo '❇️ Install all IDEs'

# Install jetbrains IDEs
echo 'ℹ️ Install jetbrains-toolbox'
brew install --cask jetbrains-toolbox
# Install vscode
echo 'ℹ️ Install visual-studio-code'
brew install --cask visual-studio-code
# Install cursor
echo 'ℹ️ Install cursor-universal'
brew tap Scrait/cursor-universal
brew install --cask cursor-universal




echo '🔷 Install languages'

# Install all node tools
echo '❇️ Install all Node tools'

# Download and install Node.js:
echo 'ℹ️ Install node'
brew install node@24
# Verify the Node.js version:
node -v # Should print "v24.4.0".
# Verify npm version:
npm -v # Should print "11.4.2".
# Install pnpm:
echo 'ℹ️ Install pnpm'
brew install pnpm
pnpm -v # verify installation



# Install java
echo '❇️ Install java'

# Install coretto@8
echo 'ℹ️ Install corretto@8'
brew install --cask corretto@8
# Install coretto@17
echo 'ℹ️ Install corretto@17'
brew install --cask corretto@17
# Install coretto@21
echo 'ℹ️ Install corretto@21'
brew install --cask corretto@21

java --version # verify installation



# Install python
echo '❇️ Install python'

# Install python@3.9
echo 'ℹ️ Install python@3.9'
brew install python@3.9
# Install python@3.11
echo 'ℹ️ Install python@3.11'
brew install python@3.11
# Install python@3.13
echo 'ℹ️ Install python@3.13'
brew install python@3.13
# Install pipenv
echo 'ℹ️ Install pipenv'
brew install pipenv
# Download and upgrade setuptools && pip
echo 'ℹ️ Download and upgrade setuptools and pip'
pip install --upgrade setuptools
pip install --upgrade pip
# Install pyenv
echo 'ℹ️ Install pyenv'
brew install pyenv

python3 --version # verify installation



# Install python
echo '❇️ Install go'

# Install latest go (TODO: Add other go versions)
echo 'ℹ️ Install go@1.24, golang, google-go'
brew install go

go version # verify installation




echo '🔷 Install web tools'

# Install http tools
echo '❇️ Install http tools'

# Install postman
echo 'ℹ️ Install postman'
brew install --cask postman
# Install cloudpub
echo 'ℹ️ Install cloudpub'
echo '1. Download cloudpub'
curl -LO https://cloudpub.ru/download/stable/clo-2.1.1-stable-macos-aarch64.tar.gz
echo '2. Tar clo-2.1.1-stable-macos-aarch64.tar.gz'
tar -xvf clo-2.1.1-stable-macos-aarch64.tar.gz
echo '3. Move files to /usr/local/bin/'
sudo mv "clo" /usr/local/bin
sudo mv "clo 2" /usr/local/bin/clo2
echo '4. Check that /usr/local/bin in PATH'
echo $PATH | grep /usr/local/bin || echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
echo '5. Restart ~/.zshrc'
echo '✅ Done! Restart your terminal or source your ~/.zshrc to apply alias.'
echo '6. Upgrading...'
clo upgrade
clo2 upgrade
echo '7. Verifying...'
clo --version
clo2 --version
# Install termius
echo 'ℹ️ Install termius'
brew install --cask termius
# Install windows-app
echo 'ℹ️ Install windows remote desktop'
brew install --cask windows-app








echo '🔷 Install other mini-tools'

echo '❇️ Install setup tools'
echo 'ℹ️ Install mas-cli'
brew install mas

echo '❇️ Install Productivity tools'
echo 'ℹ️ Install evernote'
brew install --cask evernote                                                                            # cloud note

echo '❇️ Install Communication tools'
echo 'ℹ️ Install telegram'
brew install --cask telegram
echo 'ℹ️ Install discord'
brew install --cask discord
echo 'ℹ️ Install Canary Mail'
mas install 1236045954
echo 'ℹ️ Install slack'
brew install --cask slack
echo 'ℹ️ Install whatsapp'
brew install --cask whatsapp

echo '❇️ Install antideanon and rkn naeb tools'
echo 'ℹ️ Install outline-manager'
brew install --cask outline-manager
echo 'ℹ️ Install outline-client'
mas install 1356178125

echo '❇️ Install Databases tools'
echo 'ℹ️ Install dbeaver-community'
brew install --cask dbeaver-community # db viewer

echo '❇️ Install Music tools'
echo 'ℹ️ Install yandex-music'
brew install --cask yandex-music

echo '❇️ Install Help tools'
echo 'ℹ️ Install Pasta'
mas install 1438389787

echo '❇️ Install office'
echo 'ℹ️ Install PowerPoint'
brew install --cask microsoft-powerpoint
echo 'ℹ️ Install Word'
brew install --cask microsoft-word
echo 'ℹ️ Install Excel'
brew install --cask microsoft-excel


echo '⚙️ Last updating...'
mas upgrade
brew update
brew upgrade
