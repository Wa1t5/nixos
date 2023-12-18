#!usr/bin/env bash

sleep 10

# Update color scheme
wal -i $(swww query | awk '{print $8}')

# Restart applications that doesn't have hot-reload
systemctl --user restart fnott &
systemctl --user restart waybar &
eww reload

