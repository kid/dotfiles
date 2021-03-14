export PATH="/home/kid/.cache/zsh/zinit/plugins/junegunn---fzf-bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

if [ "$(uname)" = "Darwin" ]; then
  return
fi

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx &> /dev/null
fi
