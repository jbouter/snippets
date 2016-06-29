#!/bin/bash

if [ -f ~/.config/i3/display.txt ]; then
  SETDISPLAY=$(cat ~/.config/i3/display.txt)
else
  SETDISPLAY=":0.0"
fi

HOUR=$(date +%H)
if [ ${HOUR:0:1} -eq 0 ]; then
  HOUR=${HOUR:1:2}
  WALL="0$(($HOUR/2*2))"
else
  WALL=$(($HOUR/2*2))
fi


# Set the wallpaper
#DISPLAY=$SETDISPLAY wallpaper-reddit --random --force
DISPLAY=$SETDISPLAY feh --bg-fill ~/documents/owncloud/wallpapers/arc_wheel.png

# Set screen blanking to 1hr
DISPLAY=$SETDISPLAY xset s 3600 3600 &
