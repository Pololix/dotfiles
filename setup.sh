#!/bin/bash

# For setting up: sudo bash ~/dotfiles/setup.sh
sudo bash ~/dotfiles/scirpts/setup-pkg.sh
sudo bash ~/dotfiles/scirpts/setup-git.sh

# Link config folders
ln -s ~/dotfiles/apps/nvim ~/.config/nvim
ln -s ~/dotfiles/apps/kitty ~/.config/kitty

ln -s ~/dotfiles/desktop/hypr ~/.config/hypr
ln -s ~/dotfiles/desktop/fuzzel ~/.config/fuzzel
ln -s ~/dotfiles/desktop/mako ~/.config/mako

# Once finished add ssh key to github from cat ~/.shh/id_ed25518.pub
