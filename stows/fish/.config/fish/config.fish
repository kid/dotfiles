# Install fundle if not available
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

set -U FZF_LEGACY_KEYBINDINGS 0

# fundle plugins
fundle plugin 'oh-my-fish/theme-bobthefish'
fundle plugin 'jethrokuan/fzf'
fundle plugin 'jethrokuan/z'
fundle init

# bobthefish configuration
set -g theme_color_scheme base16-dark
set -g theme_nerd_fonts yes

# Set missing locales
set LC_ALL en_US.UTF-8
set LANG en_US.UTF-8

# Set VIM as the default editor
set EDITOR vim

# Go setup
set GOPATH "$HOME/Code/go"
set PATH "$GOPATH/bin" $PATH

# Rbenv setup
set PATH $HOME/.rbenv/bin $PATH

set PATH "$HOME/.bin" "/usr/local/sbin" $PATH

# For QMK Firmware development
set -g fish_user_paths "/usr/local/opt/avr-gcc@7/bin" $fish_user_path

alias cat='bat'
alias get='wget -c --content-disposition'
alias cp='cp -v'
alias mv='mv -vi'
alias rm='rm -vi'
alias ll='exa -l'
alias la='exa -la'
alias lt='exa -lT'
alias vim='nvim'
alias git='hub'

if test -e ~/.config/fish/exports.private.fish
  source ~/.config/fish/exports.private.fish
end

# Base16 Shell
if status --is-interactive
  set BASE16_SHELL "$HOME/.config/base16-shell/"
  source "$BASE16_SHELL/profile_helper.fish"
end

set fish_key_bindings fish_user_key_bindings
