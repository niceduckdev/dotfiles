#!/usr/bin/env sh

battery_module() {
	battery_path="/sys/class/power_supply/BAT0"
	state=$(cat "$battery_path/status")
	percentage=$(cat "$battery_path/capacity")

	if [ "$state" = "Charging" ]; then
		icon="↑"
	else
		icon="↓"
	fi

	echo "$percentage% $icon"
}
