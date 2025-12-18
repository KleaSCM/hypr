#!/bin/bash
set -e

# Pick a random wallpaper from ~/Pictures/wallpapers and set it with swww
WALLPAPER=$(find "$HOME/Pictures/wallpapers" -type f | shuf -n 1)
if [ -z "$WALLPAPER" ]; then
  echo "No wallpapers found in $HOME/Pictures/wallpapers" >&2
  exit 1
fi

echo "$(date --iso-8601=seconds) - change-wallpaper picked: $WALLPAPER" >> /tmp/change-wallpaper.log

swww img "$WALLPAPER" --transition-type fade
