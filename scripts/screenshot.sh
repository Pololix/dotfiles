#!/bin/bash

action="$1"

mkdir ~/Screenshots
file=~/Screenshots/$(date +"%d-%m_%H:%M")

if [[ "$action" == "fullscreen" ]]; then
    grim "$file"
    wl-copy < "$file"

elif [[ "$action" == "window" ]]; then
    geo=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
    grim -g "$geo" "$file"
    wl-copy < "$file"

elif [[ "$action" == "region" ]]; then
    geo=$(slurp)
    grim -g "$geo" "$file"
    wl-copy < "$file"

else
    echo "Unkown argument por screeshotting"

fi
