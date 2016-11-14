#!/bin/bash

#Create a symbolic link to the vimrc in this folder
ln -s ~/dotfiles/.vimrc ~/.vimrc
#Create a symbolic link to the neovim init.vim in this folder
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
#Create a symbolic link to tmux.conf in this folder
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

#Clone Vundle for managing Vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#Setup vim-plug for neovim plugins
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#Clone tpm for managing tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#Create a symbolic link for the UltiSnip snippet files
mkdir -p ~/.vim/UltiSnips
ln -s ~/dotfiles/UltiSnips/php.snippets ~/.vim/UltiSnips/php.snippets
mkdir -p ~/.config/nvim/UltiSnips
ln -s ~/dotfiles/UltiSnips/php.snippets ~/.config/nvim/UltiSnips/php.snippets

#Give instructions for fonts
echo "Download good terminal fonts eg. Input Mono"
