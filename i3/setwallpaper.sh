#!/bin/bash

# Check whether it's after 6 in the evening or not
if [ $(date +%H) -ge 18 ]; then
  # It's nighttime, set the purple buck wallpaper
  DISPLAY=:0.0 feh --bg-fill ~/documents/owncloud/wallpapers/buck-night.png
else
  # It's daytime, set the blue buck wallpaper
  DISPLAY=:0.0 feh --bg-fill ~/documents/owncloud/wallpapers/buck-day.png
fi
