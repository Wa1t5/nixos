#!/usr/bin/env bash

# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals
#
# NOTE: this script is in bash (not posix shell), because the RANDOM variable
# we use is not defined in posix

pkill -9 yazi &

# Edit below to control the images transition
export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION=grow
export SWWW_TRANSITION_POS=top-left
export SWWW_TRANSITION_STEP=255
export SWWW_TRANSITION_DURATION=10

swww img $@ &

cp $@ /etc/nixos/home/waltz/stylix/

. /etc/nixos/home/waltz/dotfiles/hyprland/scripts/update_colorscheme.sh "$@"
