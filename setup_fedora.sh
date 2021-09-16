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
echo "Setting up Neovim plugins"

echo "
\"Plugins
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
call plug#end()

\"Line numbers
set number
set relativenumber

\"AirlineTheme settings
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

\"Open NERDTree automatically
autocmd VimEnter * NERDTree | wincmd p
\"Open NERDTree tab in every tab automatically
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
\"Close NERDTree automatically
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

\"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" >> ~/.config/nvim/init.vim

nvim +PlugInstall +UpdateRemotePlugins +qall

source ~/.bashrc

clear
neofetch
