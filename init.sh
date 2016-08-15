#!/bin/bash/

#Create a symbolic link to the vimrc in this folder
ln -s ~/dotfiles/.vimrc ~/.vimrc
#Create a symbolic link to the neovim init.vim in this folder
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
#Create a symbolic link to tmux.conf in this folder
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

#Clone Vundle for managing Vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#Setup dein for neovim plugins
mkdir ./dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ./dein/installer.sh
sh ./dein/installer.sh ~/.config/nvim/dein
rm -r ./dein/
#Clone tpm for managing tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#Create a symbolic link for the UltiSnip snippet files
ln -s ~/dotfiles/UltiSnips/php.snippets ~/.vim/UltiSnips/php.snippets
ln -s ~/dotfiles/UltiSnips/php.snippets ~/.config/nvim/UltiSnips/php.snippets

#Give instructions for fonts
echo "Downloads good terminal fonts eg. Input Mono"
