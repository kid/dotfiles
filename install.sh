#!/bin/bash

set -e

# Ask for the administrator password for the duration of this script
sudo -v

# Install Homebrew
if ! [ -x "$(command -v brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

brew install \
  ack \
  fish \
  git \
  gpg \
  htop \
  stow \
  tmux \
  tree \
  wget

brew cask install \
  1password \
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

# Install or update nvm
if [ -z "$NVM_DIR" ]; then
  export NVM_DIR="$HOME/.nvm" && (
    git clone https://github.com/creationix/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
  ) && . "$NVM_DIR/nvm.sh"
else
  (
    cd "$NVM_DIR"
    git fetch origin
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
  ) && . "$NVM_DIR/nvm.sh"
fi

# Install all config files
for item in `ls stows`;
do
  (stow --ignore='\.swp$' --dir=stows --target=$HOME $item)
done

# Install fish plugins
fish -c 'fundle install ; and exit'

# Sets default iTerm2 profile
defaults write com.googlecode.iterm2 "Default Bookmark Guid" -string "A879712F-6297-42E3-BFFD-9A5664D31470"

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: 3 fingers to swipe between pages, 4 to swipe between full screen apps
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -int 2

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Show IP address, hostname, OS version when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName