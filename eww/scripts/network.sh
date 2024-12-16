#!/bin/bash

if nmcli -t -f TYPE connection show --active | grep -q "802-3-ethernet"; then
    echo "ethernet"
elif nmcli -t -f TYPE connection show --active | grep -q "802-11-wireless"; then
    echo "$(nmcli -t -f NAME c show --active | head -n 1 | tr '[:upper:]' '[:lower:]' | tr ' ' '-')"
else
    echo "none"
fi
