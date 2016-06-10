#!/bin/bash/

#Create a symbolic link to the vimrc in this folder
ln -s ~/dotfiles/.vimrc ~/.vimrc
#Create a symbolic link to tmux.conf in this folder
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

#Clone Vundle for managing Vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#Clone tpm for managing tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#Clone and install patched powerline fonts for Airline plugin
git clone https://github.com/powerline/fonts.git ~/Downloads/vimfonts/
bash ~/Downloads/vimfonts/install.sh
rm -rf ~/Downloads/vimfonts/
