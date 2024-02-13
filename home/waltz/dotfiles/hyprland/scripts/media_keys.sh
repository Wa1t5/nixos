#!/usr/bin/env bash

# $1 - action
# $2 - device
# $3 - percentage

# Notification low priority
# dunstify -u low -t 600 

case $1 in
  vol)
    # Set vol
    wpctl set-volume "${2}" "${3}"
    
    # Get audio info
    get_volume="$(wpctl get-volume ${2} | awk -F'[. ]' '{print $3}')"

    # Notify
    dunstify -u low -t 600 -h string:x-dunst-stack-tag:audio "Audio: $(echo ${2} | awk -F'[_@]' '{print $4}') [${get_volume}%]" -h int:value:${get_volume}
  ;;  

  vol-mute)
    # Toggle mute
    wpctl set-mute $2 toggle

    # Get mute status
    [[ $(wpctl get-volume ${2} | awk '{print $3}') == "" ]] && mute_status="Unmuted" || mute_status="Muted"

    # Notify
    dunstify -u low -t 600  "Audio: $(echo ${2} | awk -F'[_@]' '{print $4}')" $mute_status | awk -F'[\[\]]' '{print $2}'
  ;;

  bright)
    # Set bright
    brightnessctl s $2

    # Get bright info
    get_bright="$(brightnessctl g)"

    # Notify
    dunstify -u low -t 600 -h string:x-dunst-stack-tag:bright "Screen: Bright [${get_bright}%]" -h int:value:${get_bright}
  ;;
  *) echo "No valid operation was specified" ;;
esac
