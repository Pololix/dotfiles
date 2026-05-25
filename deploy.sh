#!/bin/bash

# For deploying up: sudo bash ~/dotfiles/deploy.sh

sudo bash ~/dotfiles/scirpts/setups/setup-pkg.sh
sudo bash ~/dotfiles/scirpts/setups/setup-git.sh
sudo bash ~/dotfiles/scirpts/setups/setup-lns.sh
sudo bash ~/dotfiles/scirpts/setups/setup-extras.sh

# Once finished add ssh key to github from cat ~/.shh/id_ed25518.pub
