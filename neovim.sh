#!/usr/bin/bash

################################
### Install NeoVIM && Plugins
sudo apt install -y neovim

### Make a neovim config directory
mkdir ~/.config/nvim
cp ./neovim/init.vim ~/.config/nvim/init.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp -rf ./neovim/vim-plug ~/.config/nvim

cp -rf ./neovim/general ~/.config/nvim
cp -rf ./neovim/keys ~/.config/nvim

sudo apt install -y xsel
pip3 install pynvim
sudo apt install -y nodejs
sudo npm i -g neovim

cp -rf ./neovim/themes ~/.config/nvim

sudo npm i -g yarn
cp -rf ./neovim/plug-config ~/.config/nvim

nvim +PlugInstall +qall
nvim +PlugUpdate +qall

nvim -c 'CocInstall -sync coc-json coc-python coc-snippets coc-vimlsp coc-explorer'
cp -rf ./neovim/coc-settings.json ~/.config/nvim

sudo apt install -y xorg-dev
sudo apt install -y ranger
pip3 install ueberzug
cp -rf ./ranger ~/.config/ranger
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

mkdir -p ~/.local/share/fonts
cp -rf ./'Fira Code Regular Nerd Font Complete.otf' ~/.local/share/fonts/'Fira Code Regular Nerd Font Complete.otf' 
