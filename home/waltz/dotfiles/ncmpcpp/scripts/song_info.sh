#!/usr/bin/env bash

function get_info() {
  title="$(playerctl -p mpd metadata  xesam:title)"
  album="$(playerctl -p mpd metadata xesam:album)"
  artist="$(playerctl -p mpd metadata xesam:artist)"
  art="$(playerctl -p mpd metadata mpris:artUrl)"
  status="$(playerctl -p mpd status)"
  preview="/tmp/current_song.png"
  magick $(playerctl -p mpd metadata mpris:artUrl) -resize 128x128\> "${preview}"
}

function notify() {
  notify-send -a "Music: " -i "${preview}" -u normal -t 6200 "
  Title: ${title}
  Album: ${album} 
  Artist: ${artist}
  Status: ${status}
  "
}


$(
  # Wait 3 seconds before fetching info
  sleep 3

  # Fetch info
  get_info

  # Notify
  notify
)& # Now we run this in background to avoid freezing ncmpcpp
