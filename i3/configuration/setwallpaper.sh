#!/bin/bash

if [ -f ~/.config/i3/display.txt ]; then
  SETDISPLAY=$(cat ~/.config/i3/display.txt)
else
  SETDISPLAY=":0.0"
fi

# Between 8 PM and 4 AM, I want the 'night' wallpaper
if [ $(date +%H) -ge 20 ] && [ $(date +%H) -lt 4 ]; then
  DAYTIME=night
# Between 4 AM and 12 PM, I want the 'morning' wallpaper
elif [ $(date +%H) -ge 4 ] && [ $(date +%H) -lt 12 ]; then
  DAYTIME=morning
# Between 12 PM and 8 PM, I want the 'afternoon' wallpaper
elif [ $(date +%H) -ge 12 ] && [ $(date +%H) -lt 20 ]; then
  DAYTIME=afternoon
fi

# Set the actual wallpaper
DISPLAY=$SETDISPLAY feh --bg-fill ~/documents/owncloud/wallpapers/tree_$DAYTIME.jpg
