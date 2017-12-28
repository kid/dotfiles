# Install fundle if not available
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

# fundle plugins
fundle plugin 'edc/bass'
fundle plugin 'oh-my-fish/theme-bobthefish'
fundle plugin 'fisherman/z'
fundle plugin 'fisherman/getopts'
fundle init

# bobthefish configuration
set -g theme_color_scheme base16-dark
set -g theme_nerd_fonts yes

# Set missing locales
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

# Set VIM as the default editor
set -x EDITOR vim

# Go setup
set -x GOPATH "$HOME/Code/go"
set -x PATH "$GOPATH/bin" $PATH

set -x PATH "$HOME/.bin" "/usr/local/sbin" $PATH

alias get='wget -c --content-disposition'
alias cp='cp -v'
alias mv='mv -vi'
alias rm='rm -vi'

if test -e ~/.config/fish/exports.private.fish
  source ~/.config/fish/exports.private.fish
end

if test -e ~/.iterm2_shell_integration.fish
  source ~/.iterm2_shell_integration.fish
end

if test -e ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
end

eval (direnv hook fish)

# Base16 Shell
if status --is-interactive
  eval sh $HOME/.config/base16-shell/scripts/base16-eighties.sh
end
