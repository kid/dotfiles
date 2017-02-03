#!/bin/bash

set -e

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
  font-anonymouspro-nerd-font \
  font-anonymouspro-nerd-font-mono \
  font-inconsolata-nerd-font \
  font-inconsolata-nerd-font-mono

for item in `ls stows`;
do
  (stow --ignore='\.swp$' --dir=stows --target=$HOME $item)
done

fish -c 'fundle install ; and exit'
