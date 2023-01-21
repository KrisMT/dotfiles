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
cp -r ./nvim ~/.config

