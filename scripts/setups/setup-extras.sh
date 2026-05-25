#!/bin/bash

# Fonts
mkdir -p ~/.local/share/fonts
cp ~/dotfiles/assets/fonts/*.ttf ~/.local/share/fonts
fc-cache -fv
