#!/bin/bash

DIR="$HOME/Screenshots"
mkdir -p $DIR

FILE="$DIR/$(date +"%d-%m_%H:%M").png"

case "$1" in
    region)
        GEOMETRY=$(slurp)
        grim -g "$GEOMETRY" "$FILE"
        wl-copy --type image/png < "$FILE"
        ;;

    window)
        GEOMETRY=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
        grim -g "$GEOMETRY" "$FILE"
        wl-copy --type image/png < "$FILE"
        ;;

    fullscreen)
        grim "$FILE"
        wl-copy --type image/png < "$FILE"
        ;;

    *)
        ;;
esac
