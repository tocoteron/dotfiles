#!/bin/bash
install_dir="$HOME/dotfiles/nvim"
link_dir="$HOME/.config/nvim"
mkdir -p $install_dir
cp -r . $install_dir/
ln -s $install_dir $link_dir
