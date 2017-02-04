#!/bin/bash

set -e

# Install Homebrew
if ! [ -x "$(command -v brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

brew install \
  ack \
  bash \
  bash-completion \
  fish \
  git \
  gpg \
  htop \
  stow \
  tmux \
  tree \
  vim \
  wget

brew cask install \
  1password \
  docker \
  dropbox \
  google-chrome \
  iterm2 \
  keybase \
  slack \
  visual-studio-code

brew tap caskroom/fonts
brew cask install \
  font-inconsolata-nerd-font \
  font-inconsolata-nerd-font-mono

# Import GPG key from keybase
if ! gpg --list-keys DBC6BA64 > /dev/null 2>&1; then
  keybase pgp export -q DBC6BA64 | gpg --import
  keybase pgp export -q DBC6BA64 --secret | gpg --allow-secret-key-import --import
fi

# Install or update nvm
if [ -n "$NVM_DIR" ] && [ -f "$NVM_DIR/nvm.sh" ]; then
  (
    cd "$NVM_DIR"
    git fetch origin
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
  ) && . "$NVM_DIR/nvm.sh"
else
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

# Sets default iTerm2 profile
defaults write com.googlecode.iterm2 "Default Bookmark Guid" -string "A879712F-6297-42E3-BFFD-9A5664D31470"

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleMultitouchTrackpad Clicking -bool true

# Trackpad: 3 fingers to swipe between pages, 4 to swipe between full screen apps
defaults write com.apple.driver.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 1
defaults write com.apple.driver.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
