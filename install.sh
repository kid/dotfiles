#!/usr/bin/env sh

set -e

os="$(uname -s)"
case $os in
  "Darwin"*) 
    # Allow apps from unindentifeid developers
    sudo spctl --master-disable

    if ! [ -x "$(command -v brew)" ]; then
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
      brew update
    fi

    brew analytics off

    # Install all our dependencies with bundle (See Brewfile)
    brew tap homebrew/bundle
    brew bundle
    ;;
  "FreeBSD"*)
    sudo pkg install --yes \
      bash \
      diff-so-fancy \
      fd-find \
      gnupg \
      go \
      neovim \
      node \
      python3 \
      stow \
      tmux \
      yarn \
      zsh
    sudo python3 -m ensurepip
    sudo pip3 install neovim

    # shellcheck disable=SC2006
    sudo chsh -s "`command -v zsh`" "$USER"
    ;;
  *)
    echo "ERROR: unsupported OS: $os"
    exit 1
    ;;
esac

mkdir -p ~/.bin
mkdir -p ~/.cargo/bin
mkdir -p ~/Code/go/bin

# Import GPG key from keybase
# if ! gpg --list-keys D03B70DA66DF1DEA > /dev/null 2>&1; then
#   keybase login
#   keybase pgp export -q D03B70DA66DF1DEA | gpg --import
#   keybase pgp export -q D03B70DA66DF1DEA --secret | gpg --allow-secret-key-import --import
# fi

# Install all config files
for item in stows/*
do
  stow --ignore='\.swp$' --dir=stows --target="$HOME" "${item#stows/}"
done

"$HOME/.fzf/install" --completion --key-bindings --no-update-rc --no-bash --no-fish

if [ "$os" = "Darwin" ]; then
  # docker-machine-driver-xhyve need root owner and uid
  # sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
  # sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve

  # Set macOS preferences
  # We will run this last because this will reload the shell
  . mac.settings.sh
fi

# shellcheck disable=SC1090
. "$HOME/.zprofile"

nvim "+UpdateRemotePlugins" "+PlugUpdate!" "+qa"

exec zsh
