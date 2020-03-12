#!/bin/bash
install_dir="$HOME/dotfiles/vim"
vim_dir="$HOME/.vim"
vimrc_dir="$HOME/.vimrc"
mkdir -p $install_dir
cp -r . $install_dir/
ln -s $install_dir/.vim $vim_dir
ln -s $install_dir/.vimrc $vimrc_dir
