#!/bin/bash

grim -g "$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" - | tee ~/Screenshots/$(date +%Y%m%d_%H%M%S).png | wl-copy
