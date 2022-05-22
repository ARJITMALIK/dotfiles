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

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p /run/media/arjit/CODE/
mkdir -p /run/media/arjit/DOWNLOADS/
mkdir -p /run/media/arjit/MISC/
mkdir -p /run/media/arjit/FILES/

cd polybar
chmod +x launch.sh
cd script
chmod +x ppd-status
chmod +x spotify_status.py
cd ../..

cd zsh
sudo cp agnoster.zsh-theme ~/.oh-my-zsh/themes/
sudo cp .zshrc ~/
sudo cp .zshrc.pre-oh-my-zsh
cd ..

sudo cp picom.conf ~/.config/

sudo cp -r kitty/ ~/.config/
sudo cp -r i3/ ~/.config/
sudo cp -r dunst/ ~/.config/
sudo cp -r nvim/ ~/.config/
sudo cp -r polybar/ ~/.config/
sudo cp -r rofi/ ~/.config/
