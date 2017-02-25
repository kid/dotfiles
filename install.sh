#!/usr/bin/env bash

set -e

# Install Homebrew
if [[ $OSTYPE =~ ^darwin ]]; then
  if ! [ -x "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    brew update
  fi

  # Install all our dependencies with bundle (See Brewfile)
  brew tap homebrew/bundle
  brew bundle
fi

# Import GPG key from keybase
if ! gpg --list-keys DBC6BA64 > /dev/null 2>&1; then
  keybase pgp export -q DBC6BA64 | gpg --import
  keybase pgp export -q DBC6BA64 --secret | gpg --allow-secret-key-import --import
fi

# Install or update nvm
if [ -f "$HOME/.nvm/nvm.sh" ]; then
  echo "Upgrading nvm..."
  export NVM_DIR="$HOME/.nvm" && (
    cd "$NVM_DIR"
    git fetch origin
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
  ) && . "$NVM_DIR/nvm.sh"
else
  echo "Installing nvm..."
  export NVM_DIR="$HOME/.nvm" && (
    git clone https://github.com/creationix/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
  ) && . "$NVM_DIR/nvm.sh"
fi

# Install all config files
for item in `ls stows`
do
  stow --ignore='\.swp$' --dir=stows --target=$HOME $item
done

# Install fish plugins
fish -c 'fundle install'

# Install vscode extensions
code --install-extension EditorConfig.EditorConfig
code --install-extension nepaul.editorconfiggenerator
code --install-extension bsides.Theme-Base16-Eighties
code --install-extension robertohuertasm.vscode-icons
code --install-extension christian-kohler.path-intellisense
code --install-extension formulahendry.auto-rename-tag
code --install-extension spywhere.guides
code --install-extension wmaurer.vscode-jumpy
code --install-extension dzannotti.vscode-babel-coloring

# Set macOS preferences
# We will run this last because this will reload the shell
if [[ $OSTYPE =~ ^darwin ]]; then
  source mac.settings.sh
fi
