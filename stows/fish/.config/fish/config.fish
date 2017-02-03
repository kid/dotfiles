if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

fundle plugin 'edc/bass'
fundle plugin 'oh-my-fish/theme-bobthefish'
fundle init

set -g theme_color_scheme base16-dark
set -g theme_nerd_fonts yes
