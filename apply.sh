#!/bin/bash

DIRNAME=$(realpath $(dirname $0))

# Applying karabiner assets config
echo "Applying Karabiner configuation..."
mkdir -p ${HOME}/.config/karabiner/assets/complex_modifications
for file in $(ls -1 karabiner); do
  ln -sf ${DIRNAME}/karabiner/${file} ${HOME}/.config/karabiner/assets/complex_modifications/${file}
done

# zsh
echo "Applying zsh configuation..."
ln -sf ${DIRNAME}/shell/zshrc ${HOME}/.zshrc

# neovim
echo "Applying neovim configuration..."
cp ${DIRNAME}/vimrc ${HOME}/.vimrc
mkdir -p ${HOME}/.config/nvim
ln -sf ${HOME}/.vimrc ${HOME}/.config/nvim/init.vim
nvim +PluginInstall +GoInstallBinaries +qall >/dev/null
