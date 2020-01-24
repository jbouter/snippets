#!/usr/bin/env bash

LAT=""
LON=""
SUNTIMES=$(curl -XGET -s "https://api.sunrise-sunset.org/json?lat=$LAT&lng=$LON&formatted=0" | awk '{ split($0,a,"\""); print a[6]"\n"a[10]}')
SUNRISE=$(echo $SUNTIMES | awk '/T/ { print $1 }')
SUNSET=$(echo $SUNTIMES | awk '/T/ { print $2 }')

EPOCHSUNRISE=$(date +%s -d "$SUNRISE")
EPOCHSUNSET=$(date +%s -d "$SUNSET")
EPOCHCURRENT=$(date +%s)

if [ ! -f ~/.plasmatime ]; then
  touch ~/.plasmatime
fi

if [ "$EPOCHCURRENT" -gt "$EPOCHSUNRISE" ] && [ "$EPOCHCURRENT" -lt "$EPOCHSUNSET" ]; then
  # Daytime
  if [ $(cat ~/.plasmatime) != "daytime" ]; then
    lookandfeeltool -a org.kde.breeze.desktop
    echo "daytime" > ~/.plasmatime
  fi
elif [ "$EPOCHCURRENT" -lt "$EPOCHSUNRISE" ] || [ "$EPOCHCURRENT" -gt "$EPOCHSUNSET" ]; then
  # Nighttime
  if [ $(cat ~/.plasmatime) != "nighttime" ]; then
    lookandfeeltool -a org.kde.breezedark.desktop
    echo "nighttime" > ~/.plasmatime
  fi
fi
