#!/bin/bash

DIRNAME=$(realpath $(dirname $0))

# installing brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# and some packages
brew install ansible \
             antigen \
			 coreutils \
			 derailed/k9s/k9s \
			 fzf \
			 git \
			 goku \
			 jq \
			 neovim \
			 terraform \
			 vault \
			 yqrashawn/goku/goku
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

# neovim
echo "Applying neovim configuration..."
cp ${DIRNAME}/vimrc ${HOME}/.vimrc
mkdir -p ${HOME}/.config/nvim
ln -sf ${HOME}/.vimrc ${HOME}/.config/nvim/init.vim
nvim +PluginInstall +GoInstallBinaries +qall >/dev/null