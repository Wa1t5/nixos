#!/usr/bin/env sh

# Import pywal colors
. ~/.cache/wal/colors.sh

# Lock Screen
$@ \
  --daemonize \
  --screenshot \
  --effect-blur 3x1 \
  --indicator \
  --clock \
  --inside-color "${color5}" \
  --inside-clear-color "${color5}" \
  --inside-ver-color "${color5}" \
  --inside-wrong-color "${color5}" \
  --layout-bg-color "${color5}" \
  --key-hl-color "${color2}" \
  --text-color ffffff \
  --text-clear-color ffffff \
  --ring-color "${color0}" \
  --ring-clear-color "${color0}" \
  --ring-ver-color "${color0}" \
  --ring-wrong-color "${color0}"
