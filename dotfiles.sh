#!/bin/bash

cd $Home

# Cloning git repo
git clone https://github.com/TuX-sudo/dotfiles.git

# vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline

# Copying dotfiles
cp -r dotfiles/.vimrc .
cp -r dotfiles/.bash* .
chmod +x .bashrc.d/*
source .bashrc &> /dev/null
cp -r dotfiles/scripts/ .
chmod +x scripts/*.sh
