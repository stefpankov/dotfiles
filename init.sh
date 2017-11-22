#!/bin/bash

#Create a symbolic link to the vimrc in this folder
#ln -s ~/dotfiles/.vimrc ~/.vimrc
#Create a symbolic link to the neovim init.vim in this folder
echo "Initializing neovim configuration"
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
#Create a symbolic link to tmux.conf in this folder
echo "Initializing tmux configuration"
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

#Setup vim-plug for neovim plugins
echo "Setting up vim-plug"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#Clone tpm for managing tmux plugins
echo "Setting up the tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#Create a symbolic link for the UltiSnip snippet files
echo "Setting up neovim snippets"
mkdir -p ~/.vim/UltiSnips
ln -s ~/dotfiles/UltiSnips/php.snippets ~/.vim/UltiSnips/php.snippets
mkdir -p ~/.config/nvim/UltiSnips
ln -s ~/dotfiles/UltiSnips/php.snippets ~/.config/nvim/UltiSnips/php.snippets
