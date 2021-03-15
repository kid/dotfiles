export PATH="/home/kid/.cache/zsh/zinit/plugins/junegunn---fzf-bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

if [ "$(uname)" = "Darwin" ]; then
  return
fi

if [ "$TERM" = "linux" ]; then
  _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
  for i in $(sed -n "$_SEDCMD" "$HOME/.Xresources" | awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
    echo -en "$i"
  done
  clear
fi

export PATH="/home/kid/.cache/zsh/zinit/plugins/junegunn---fzf-bin:$PATH"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  startx &> /dev/null
fi
