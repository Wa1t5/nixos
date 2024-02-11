#!usr/bin/env bash

#sleep 10

# Update color scheme
cp "$@" /etc/nixos/home/waltz/dotfiles/stylix/wallpaper.png
cd /etc/nixos

git add .

pkexec nixos-rebuild switch 
