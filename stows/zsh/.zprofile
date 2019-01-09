# eliminates duplicates in *paths
typeset -gU cdpath fpath path

# Zsh search path for executable
path=(
  /usr/local/{bin,sbin}
  $path
)

export TERM="xterm-256color"
export LC_ALL=en_US.UTF-8
