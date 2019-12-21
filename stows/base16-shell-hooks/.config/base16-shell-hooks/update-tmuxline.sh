#!/usr/bin/env bash
if [ -n "$TMUX" ]; then
  nvim -u ~/.dotfiles/config.vim -c 'TmuxlineSnapshot! ~/.vimrc_tmuxline | qa'
else
  tmux new-session "nvim -u ~/.dotfiles/config.vim -c 'TmuxlineSnapshot! ~/.vimrc_tmuxline | qa'"
fi
