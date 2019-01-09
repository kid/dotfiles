[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# shellcheck disable=SC1090
. "$HOME/.asdf/asdf.sh"
# shellcheck disable=SC1090
. "$HOME/.asdf/completions/asdf.bash"

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

ftpane() {
  local panes current_window current_pane target target_window target_pane
  panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
  current_pane=$(tmux display-message -p '#I:#P')
  current_window=$(tmux display-message -p '#I')

  target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

  target_window=$(echo "$target" | awk 'BEGIN{FS=":|-"} {print$1}')
  target_pane=$(echo "$target" | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

  if [[ "$current_window" -eq "$target_window" ]]; then
    tmux select-pane -t "${target_window}.${target_pane}"
  else
    tmux select-pane -t "${target_window}.${target_pane}" &&
    tmux select-window -t "$target_window"
  fi
}
