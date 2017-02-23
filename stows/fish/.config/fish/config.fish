# Install fundle if not available
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

# fundle plugins
fundle plugin 'edc/bass'
fundle plugin 'oh-my-fish/theme-bobthefish'
fundle init

# bobthefish configuration
set -g theme_color_scheme base16-dark
set -g theme_nerd_fonts yes

function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# Set VIM as the default editor
set -x EDITOR vim

alias get='wget -c --content-disposition'
alias mv='mv -i'
alias rm='rm -i'
