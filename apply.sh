#!/bin/bash

DIRNAME=$(realpath $(dirname $0))

# installing brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# and some packages
brew install ansible \
             antigen \
             coreutils \
             derailed/k9s/k9s \
             faas-cli \
             fzf \
             git \
             goku \
             jq \
             neovim \
             stern \
             telnet \
             terraform \
             tig \
             vault \
             yqrashawn/goku/goku \
             zlib \
             sqlite
services start yqrashawn/goku/goku


if [ -e /Applications/Karabiner-Elements.app ]; then
  # Applying karabiner assets config
  echo "Applying Karabiner configuation..."
  mkdir -p ${HOME}/.config/karabiner/assets/complex_modifications
  for file in $(ls -1 karabiner); do
    ln -sf ${DIRNAME}/karabiner/${file} ${HOME}/.config/karabiner/assets/complex_modifications/${file}
  done
else
  echo "Karabiner is not install, download and install it from https://pqrs.org/osx/karabiner"
fi

# zsh
echo "Applying zsh configuation..."
ln -sf ${DIRNAME}/shell/zshrc ${HOME}/.zshrc
# zsh.d
mkdir -p ~/zshrc.d
cp ${DIRNAME}/shell/zshrc.d/trailing_spaces ~/.zshrc.d/trailing_spaces

# neovim
echo "Applying neovim configuration..."
cp ${DIRNAME}/vimrc ${HOME}/.vimrc
mkdir -p ${HOME}/.config/nvim
ln -sf ${HOME}/.vimrc ${HOME}/.config/nvim/init.vim
vim +PluginInstall +GoInstallBinaries +qall >/dev/null

# Iterm2
# Installing shell integrations
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash
