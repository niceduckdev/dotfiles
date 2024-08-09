#!/bin/bash

command -v bluetoothctl >/dev/null 2>&1 || { echo >&2 "Bluetoothctl is not installed. Please install it."; exit 1; }
status=""

bluetoothctl show | grep -q "Powered: yes"
if [ $? -eq 0 ]; then
    status="On"
else
    status="Off"
fi

echo " $status"