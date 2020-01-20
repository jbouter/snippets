#!/bin/bash

if [ $(xinput list-props 'SYNA2393:00 06CB:7A13 Touchpad' | awk '/libinput Natural Scrolling Enabled \(/ { print $6 }') -ne 1 ]; then
  xinput set-prop 'SYNA2393:00 06CB:7A13 Touchpad' 'libinput Natural Scrolling Enabled' 1
fi
