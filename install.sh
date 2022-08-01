!#!/bin/bash

sudo pacman -Syu tree-sitter luajit xclip kitty polybar okular zsh discord brightnessctl yarn nodejs npm ranger tmux exa neovim spectacle kvantum
chsh -s $(which zsh)

yay brave-bin
yay nerd-fonts-jetbrains-mono
yay ttf-font-awesome
yay batsignal
yay spotify
yay spotify-adblock-git
yay notion-app
yay cava
yay gtop
yay nvidia-prime
yay gnome-keyring
yay fd
yay rofi-greenclip

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo mkdir -p /run/media/arjit/CODE/
sudo mkdir -p /run/media/arjit/DOWNLOADS/
sudo mkdir -p /run/media/arjit/MISC/
sudo mkdir -p /run/media/arjit/FILES/

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

sudo cp .screenlayout/ ~/

sudo cp -r kitty/ ~/.config/
sudo cp -r i3/ ~/.config/
sudo cp -r dunst/ ~/.config/
sudo cp -r nvim/ ~/.config/
sudo cp -r polybar/ ~/.config/
sudo cp -r rofi/ ~/.config/
sudo cp -r Kvantum/ ~/.config/
sudo cp -r nitrogen/ ~/.config/
sudo cp ./greenclip.toml ~/.config/
cd && cd Pictures/
git clone https://github.com/ARJITMALIK/Wallpapers.git

if id -u "arjit" >/dev/null 2>&1; then
    sudo cp fstab /etc/
fi

echo "export QT_STYLE_OVERRIDE=kvantum" >> ~/.profile
cd
cd /etc/
sudo echo "QT_STYLE_OVERRIDE=kvantum"

echo "Dont forget to configure your ssh, and have a good time biromdir."
