#!/bin/bash

# For deploying:
# sudo bash ~/dotfiles/scripts/actions/deploy.sh

# Link .configs
bash ~/dotfiles/scripts/setups/set-symlinks.sh 

# Init git
bash ~/dotfiles/scripts/setups/set-git.sh 

# Load fonts
bash ~/dotfiles/scripts/setups/set-assets.sh 
