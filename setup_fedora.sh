#!/bin/bash
echo "Flo's set up script for Fedora/RHEL like distributions"

sudo dnf update --refresh -y

echo ""
echo "Now installing epel-release repo will fail on Fedora but also not needed"
sudo dnf install epel-release -y

echo ""
echo "Installing general shit"
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

mkdir -p ~/.config/nvim

echo "
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set number
set relativenumber
" >> ~/.config/nvim/init.vim

nvim +PlugInstall +qall

neofetch
