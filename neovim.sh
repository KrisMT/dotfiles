#!/usr/bin/bash


################################
### Add neovim unstable repo
sudo add-apt-repository ppa:neovim-ppa/unstable


################################
### Install NeoVIM && Plugins
sudo apt install -y neovim
sudo apt install -y ripgrep

### Make a neovim config directory
mkdir ~/.config
#cp -r ./nvim ~/.config

#Backup the old config
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim

