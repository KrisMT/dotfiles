#!/usr/bin/bash

## Change theme to tango && dark

#########################
### Install ZSH
sudo apt-get install zsh -y

#########################
### Git and configuration
sudo apt-get install git -y
sudo apt-get install curl -y
cp -rf gitconfig ~/.gitconfig


######################
### Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

######################
### Install syntax highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

######################
### Install auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

######################
### TMUX
sudo apt-get install tmux -y

cp -rf tmux.conf ~/.tmux.conf

######################
### Star ship
curl -sS https://starship.rs/install.sh | sh
mkdir -p ~/.config && touch ~/.config/starship.toml
cp -rf starship.toml ~/.config/starship.toml 

cp -rf zshrc ~/.zshrc
