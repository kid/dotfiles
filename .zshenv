#!/usr/bin/env zsh
# shellcheck shell=bash

if [[ -z "$XDG_CONFIG_HOME" ]]
then
  export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -z "$XDG_DATA_HOME" ]]
then
  export XDG_DATA_HOME="$HOME/.local/share"
fi

if [[ -z "$XDG_CACHE_HOME" ]]
then
  export XDG_CACHE_HOME="$HOME/.cache"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
  export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi

export HISTFILE="$XDG_DATA_HOME/zsh/zsh_history"

export GO11MODULE="auto"
export GOPATH="$HOME/.go"

if [[ -d "$GOPATH/bin" ]]
then
  export PATH="$GOPATH/bin:$PATH"
fi

if [[ -d "$HOME/.local/bin" ]]
then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [[ -d "$HOME/.cargo/bin" ]]
then
  export PATH="$HOME/.cargo/bin:$PATH"
fi
