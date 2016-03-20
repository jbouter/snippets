#!/bin/bash

if [ -f ~/.config/i3/display.txt ]; then
  SETDISPLAY=$(cat ~/.config/i3/display.txt)
else
  SETDISPLAY=":0.0"

# Check whether it's after 6 in the evening or not
if [ $(date +%H) -ge 18 ]; then
  # It's nighttime, set the purple buck wallpaper
  DISPLAY=$SETDISPLAY feh --bg-fill ~/documents/owncloud/wallpapers/buck-night.png
else
  # It's daytime, set the blue buck wallpaper
  DISPLAY=$SETDISPLAY feh --bg-fill ~/documents/owncloud/wallpapers/buck-day.png
fi
