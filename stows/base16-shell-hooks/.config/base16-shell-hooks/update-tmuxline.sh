#!/usr/bin/env bash
if [ -n "$TMUX" ]; then
  nvim +'TmuxlineSnapshot! ~/.vimrc_tmuxline' +qa
else
  tmux new-session "nvim +'TmuxlineSnapshot! ~/.vimrc_tmuxline' +qa"
fi
