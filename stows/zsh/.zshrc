# DEFAULT_USER='kid'
# POWERLEVEL9K_IGNORE_TERM_COLORS=true
# POWERLEVEL9K_MODE='nerdfont-complete'
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
# POWERLEVEL9K_TIME_FOREGROUND='white'
# POWERLEVEL9K_TIME_BACKGROUND='transparent'
# POWERLEVEL9K_VI_INSERT_MODE_STRING='I'
# POWERLEVEL9K_VI_COMMAND_MODE_STRING='N'

source ~/.zplugin/bin/zplugin.zsh

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
# setopt share_history # share history between different instances of the shell
setopt histignorespace # don't save commands that starts with a space

setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

setopt autopushd
setopt prompt_subst

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"

[ -n "$PS1" ] && [ -s "~/.local/share/dein/repos/github.com/morhetz/gruvbox/gruvbox_256palette.sh" ] && source ~/.local/share/dein/repos/github.com/morhetz/gruvbox/gruvbox_256palette.sh

zplugin ice wait'1' atload'_zsh_autosuggest_start'
zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-history-substring-search
zplugin light zdharma/fast-syntax-highlighting

zplugin snippet https://github.com/sbugzu/gruvbox-zsh/blob/master/gruvbox.zsh-theme
zplugin snippet https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh
# zplugin light bhilburn/powerlevel9k
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light dfurnes/purer

# Only for Linux:
# zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh"
# zplugin light trapd00r/LS_COLORS
# Only for Mac:
export CLICOLOR=YES

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category

zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

# Only show hostnames for ssh completion
zstyle ':completion::complete:ssh:*' tag-order hosts

bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char

alias cat='bat'
alias get='wget -c --content-disposition'
alias cp='cp -v'
alias mv='mv -vi'
alias rm='rm -vi'
alias '?'='nocorrect whence -asvf'

alias g='git'
alias k='kubectl'

if type exa > /dev/null ; then
  alias ls='exa'
  alias ll='exa -l'
  alias la='exa -la'
  alias lt='exa -lT'
else
  alias ls='ls --color -F'
  alias ll='ls --color -lh'
  alias la='ls --color -lha'
fi

alias vim='nvim'

export EDITOR='nvim'

export GOPATH="$HOME/Code/go"
export PATH="$HOME/.bin:$GOPATH/bin:$HOME/.rbenv/bin:$PATH"

# bindkey '^[b' backward-word
# bindkey '^[f' forward-word

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
ZSH_THEME="" 

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

#
# https://gist.github.com/ctechols/ca1035271ad134841284
# https://carlosbecker.com/posts/speeding-up-zsh
#
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
  compinit;
else
  compinit -C;
fi

[ -f $HOME/.asdf/asdf.sh ] && . $HOME/.asdf/asdf.sh
[ -f $HOME/.asdf/completions/asdf.bash ] &&. $HOME/.asdf/completions/asdf.bash

eval "$(rbenv init -)"

# export LDFLAGS="-L/usr/local/opt/readline/lib"
# export CPPFLAGS="-I/usr/local/opt/readline/include"
# export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
# export CFLAGS="-I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include"
# export LDFLAGS="-L$(brew --prefix openssl)/lib"


export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval "$(direnv hook zsh)"
