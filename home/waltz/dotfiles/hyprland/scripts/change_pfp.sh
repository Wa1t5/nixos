#!/usr/bin/env bash

pkill -9 yazi &
#sed -iE s,path\ \=.\*,path\ \=\ $@,g /etc/nixos/home/waltz/dotfiles/hyprlock/config.nix &
#sed -iE s,path\ \=.\*,path\ \=\ $@,g /home/waltz/.config/hypr/hyprlock.conf &
cp $@ /home/waltz/.config/hypr/pfp