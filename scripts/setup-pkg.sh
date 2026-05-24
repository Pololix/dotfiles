#!/bin/bash

sudo pacman -S --noconfirm \
    iwd networkmanager wireplumber \
    brightnessctl \
    pipewire pipewire-alsa pipewire-pulse \
    bluez bluez-utils \
    grim jq slurp wl-clipboard \
    hyprland hypridle hyprlock hyprsunset \
    fuzzel kitty neovim waybar \
    base base-devel linux linux-firmware \
    intel-media-driver intel-ucode libva-intel-driver \
    qt5-wayland qt6-wayland \
    xdg-desktop-portal-gtk xdg-desktop-portal-hyprland \
    git firefox openssh sudo unzip wev
