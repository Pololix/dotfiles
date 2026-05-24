#!/bin/bash

# For setting up: sudo bash ~/dotfiles/setup.sh
sudo bash ~/dotfiles/scirpts/setup-pkg.sh
sudo bash ~/dotfiles/scirpts/setup-git.sh

# Link config folders
ln -s ~/dotfiles/apps/nvim ~/.config/nvim
ln -s ~/dotfiles/apps/kitty ~/.config/kitty

ln -s ~/dotfiles/desktop-enviroment/hypr ~/.config/hypr
ln -s ~/dotfiles/desktop-enviroment/fuzzel ~/.config/fuzzel
ln -s ~/dotfiles/desktop-enviroment/mako ~/.config/mako

# Setup fonts
mkdir -p ~/.local/share/fonts
cp ~/dotfiles/assets/fonts/*.ttf ~/.local/share/fonts
fc-cache -fv

# Once finished add ssh key to github from cat ~/.shh/id_ed25518.pub
