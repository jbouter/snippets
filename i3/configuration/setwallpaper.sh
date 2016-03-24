#!/bin/bash

if [ -f ~/.config/i3/display.txt ]; then
  SETDISPLAY=$(cat ~/.config/i3/display.txt)
else
  SETDISPLAY=":0.0"
fi

HOUR=$(date +%H)
WALL=$(($HOUR/2*2))

DISPLAY=$SETDISPLAY feh --bg-fill ~/documents/owncloud/wallpapers/time_based/$WALL.png
