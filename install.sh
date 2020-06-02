#!/usr/bin/bash

## Change theme to tango && dark

#########################
### Install ZSH
sudo apt-get install zsh -y

#########################
### Git and configuration
sudo apt-get install git -y
cp -rf gitconfig ~/.gitconfig

################################
### VIM Bundle and configuration
# install
sudo apt-get install vim -y

# copy vimrc configuration file
cp -rf vimrc ~/.vimrc

# install all plugin
vim +PlugInstall +qall

# copy snippets to directory
cp -rf UltiSnips ~/.vim/bundle/vim-snippets

######################
### Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

######################
### Install spaceship for oh-my-zsh
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -sf "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

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
