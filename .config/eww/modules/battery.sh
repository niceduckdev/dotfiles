#!/usr/bin/env bash

state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "state" | awk '{print $2}')
percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage" | awk '{print $2}' | sed 's/%//')

if [ "$state" = "charging" ]; then
    icon="↑"
else
    icon="↓"
fi

echo "$percentage% $icon"

