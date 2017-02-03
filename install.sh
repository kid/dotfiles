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

# Install all config files
for item in `ls stows`;
do
  (stow --ignore='\.swp$' --dir=stows --target=$HOME $item)
done

# Install fish plugins
fish -c 'fundle install ; and exit'

# Sets default iTerm2 profile
defaults write com.googlecode.iterm2 "Default Bookmark Guid" -string "A879712F-6297-42E3-BFFD-9A5664D31470"
