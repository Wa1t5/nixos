#!/usr/bin/env bash

# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals
#
# NOTE: this script is in bash (not posix shell), because the RANDOM variable
# we use is not defined in posix

# Edit below to control the images transition
export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION=grow
export SWWW_TRANSITION_POS=top-left
export SWWW_TRANSITION_STEP=255
export SWWW_TRANSITION_DURATION=10

# This controls (in seconds) when to switch to the next image
INTERVAL=0

#while true; do
	find "/home/waltz/img/wallpapers/" \
		| while read -r img; do
			echo "$((RANDOM % 1000)):$img"
		done \
		| sort -n | cut -d':' -f2- \
		| while read -r img; do
			swww img "$img"
			#sleep $INTERVAL
		done
#done
