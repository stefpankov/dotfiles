#!/bin/bash/

#Create a symbolic link to the vimrc in this folder
ln -s ~/dotfiles/.vimrc ~/.vimrc

#Clone Vundle for managing Vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Clone and install patchet powerline fonts for Airline plugin
git clone https://github.com/powerline/fonts.git ~/Downloads/vimfonts/
bash ~/Downloads/vimfonts/install.sh
rm -rf ~/Downloads/vimfonts/
