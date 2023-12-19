#!/usr/bin/env bash

players_i="firefox"
title_prev=""

function get_info() {
  title="$(playerctl  -i ${players_i} metadata xesam:title)"
  album="$(playerctl  -i ${players_i} metadata xesam:album)"
  artist="$(playerctl -i ${players_i} metadata xesam:artist)"
  art="$(playerctl    -i ${players_i} metadata mpris:artUrl)"
  status="$(playerctl -i ${players_i} status)"
  preview="/tmp/current_song.png"
  preview_rounded="/tmp/current_song_rounded.png"
  mask="/tmp/current_song_mask.png"

  if [[ ${title_prev} != ${title} ]]; then
    # Re-scale image
    magick $(playerctl   -i ${players_i} metadata mpris:artUrl) -resize 360x360\> "${preview}"

    # Create image mask
    convert -size 360x360 xc:none -draw "roundrectangle 0,0,360,360,32,23" ${mask}

    # Apply image mask
    convert ${preview} -matte ${mask} -compose DstIn -composite ${preview_rounded}

    # Update title_prev
    title_prev=${title};
  fi
}


function notify() {
  notify-send -a "Music: " -i "${preview}" -u normal -t 6200 "
  Title: ${title}
  Album: ${album} 
  Artist: ${artist}
  Status: ${status}
  "
}

if [[ -z $@ ]]; then
  $(
    # Wait 2 seconds before fetching info
    sleep 2

    # Fetch info
    get_info

    # Notify
    notify
  )& # Now we run this in background to avoid freezing ncmpcpp
elif [[ $@ == "daemon" ]]; then
  while (sleep 2); do
    
    if [[ $(playerctl -i ${players_i} -l | wc -l) > 0 ]]; then
      get_info
    fi
    
  done  
else
  get_info
fi
