#!/bin/bash

#
# Default block, don't remove this (setting variables)
#

# base dir for backlight class
basedir="/sys/class/backlight/"

# get the backlight handler
handler=$basedir$(ls $basedir)"/"

# get current brightness
old_brightness=$(cat $handler"brightness")

# get max brightness
max_brightness=$(cat $handler"max_brightness")

#
# End default block
#


#
# Below block works with Nvidia drivers
# Add ' Option "RegistryDwords" "EnableBrightnessControl=1"' to /etc/X11/xorg.conf.d/20-nvidia.conf
#

# Add or substract $1
new_brightness=$(( $old_brightness $1))

# Don't go above the max brightness, don't go below 1
if [ $old_brightness -lt 15 ] && [ $old_brightness -gt 1 ]; then
  # set the new brightness value
  sudo chmod 666 $handler"brightness"
  echo $new_brightness > $handler"brightness"
fi

#
# End Nvidia driver
#

#
# Below block works with Nouveau drivers
#

# get current brightness %
#old_brightness_p=$(( 100 * $old_brightness / $max_brightness ))

# calculate new brightness % 
#new_brightness_p=$(($old_brightness_p $1))

# calculate new brightness value
#new_brightness=$(( $max_brightness * $new_brightness_p / 100 ))

#
# End Nouveau drivers
#
