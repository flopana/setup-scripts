#!/bin/bash
clear
echo "Flo's set up script for Fedora like distributions"

sudo dnf update --refresh -y

echo ""
echo "Installing general stuff"
sudo dnf install htop curl wget	neovim nano git	gcc gpg make tmux neofetch flatpak -y

echo ""
echo "Adding Flathub repository to flatpak"
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo ""
echo "Setting aliases"
echo "alias ll='ls -alh'" >> ~/.bashrc
echo "alias l='ls -lh'" >> ~/.bashrc
echo "alias c='clear'" >> ~/.bashrc
echo "alias tailf='tail -f'" >> ~/.bashrc
echo "alias vim='nvim'" >> ~/.bashrc

echo ""
echo "Setting up Neovim"

echo ""
echo "Installing Vim Plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install --user neovim || pip install --user neovim

mkdir -p ~/.config/nvim

echo ""
ecoh "Setting up Neovim plugins"

echo "
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set number
set relativenumber
" >> ~/.config/nvim/init.vim

nvim +PlugInstall +UpdateRemotePlugins +qall

source ~/.bashrc

clear
neofetch
