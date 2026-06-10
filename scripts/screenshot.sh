#!/bin/bash

dir="$HOME/Screenshots"
mkdir -p $dir

file="$dir/$(date +"%d-%m_%H:%M").png"

case "$1" in
    region)
        geo=$(slurp)
        grim -g "$geo" "$file"
        wl-copy --type image/png < "$file"
        ;;

    window)
        geo=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
        grim -g "$geo" "$file"
        wl-copy --type image/png < "$file"
        ;;

    fullscreen)
        grim "$file"
        wl-copy --type image/png < "$file"
        ;;

    *)
        echo "Unknown screenshot mode: $action"
        ;;
esac
