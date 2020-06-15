if [ "$(uname)" == "Darwin" ]; then
  return
fi

export PATH="/home/kid/.cache/zsh/zinit/plugins/junegunn---fzf-bin:$PATH"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx &> /dev/null
fi
