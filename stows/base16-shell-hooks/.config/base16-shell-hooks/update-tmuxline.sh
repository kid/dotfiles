#!/usr/bin/env bash
if [ -n "$TMUX" ]; then
  vim +'TmuxlineSnapshot! ~/.vimrc_tmuxline' +qa
else
  tmux new-session "vim +'TmuxlineSnapshot! ~/.vimrc_tmuxline' +qa"
fi
