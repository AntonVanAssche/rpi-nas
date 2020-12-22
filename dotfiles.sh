#!/bin/bash

cd $Home

# Cloning git repo
git clone git@gitlab.com:sudo_TuX/dotfiles.git

# vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline

# Copying dotfiles
cp -r dotfiles/.vimrc .
cp -r dotfiles/.bash* .
chmod +x .bashrc.d/*
cp -r dotfiles/scripts/ .
chmod +x scripts/*.sh
cp -r dotfiles/.ssh/ .ssh/
chmod 700 .ssh/ && chmod 600 .ssh/* && chmod 644 .ssh/*.pub && chmod 644 .ssh/config
source .bashrc &> /dev/null
