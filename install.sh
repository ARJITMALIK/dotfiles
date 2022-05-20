!#!/bin/bash

sudo pacman -Syu tree-sitter luajit xclip kitty polybar okular zsh discord brightnessctl yarn nodejs npm ranger tmux exa screenkey
chsh -s $(which zsh)

yay brave-bin
yay wine
yay nerd-fonts-jetbrains-mono
yay ttf-font-awesome
yay batsignal
yay spotify
yay spotify-adblock-git
yay notion-app
yay cava
yay gtop
yay nvidia-prime
yay neovim-nightly-bin

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

mkdir -p /run/media/arjit/CODE/
mkdir -p /run/media/arjit/DOWNLOADS/
mkdir -p /run/media/arjit/MISC/
mkdir -p /run/media/arjit/FILES/

cp kitty/ ~/.config/
cp i3/ ~/.config/
cp dunst/ ~/.config/
cp nvim/ ~/.config/
cp polybar/ ~/.config/
cp rofi/ ~/.config/
