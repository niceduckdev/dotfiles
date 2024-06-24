#!/bin/sh

volume_prefix="VOL"
battery_prefix="BAT"
network_prefix="NET"
clock_prefix="CLK"
volume() {
	echo "$volume_prefix $(pamixer --get-volume)"
}

battery() {
	echo "$battery_prefix $(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage" | cut -b 20-27 | sed 's/ //g' | sed 's/%//g')"
}

network() {
	if nmcli -t -f TYPE connection show --active | grep -q "802-3-ethernet"; then
		echo "$network_prefix wired"
	elif nmcli -t -f TYPE connection show --active | grep -q "802-11-wireless"; then
    	echo "$network_prefix $(nmcli -t -f NAME c show --active | head -n 1)"
	else
		echo "$network_prefix none"
	fi
}

clock() {
	echo "$clock_prefix $(date '+%H:%M') $(date '+%d/%m/%Y')"
}

echo "$volume $battery $network $clock"

main() {
	while true; do
		xsetroot -name " $(volume) $(battery) $(network) $(clock)"
		sleep 1
	done
}

main
