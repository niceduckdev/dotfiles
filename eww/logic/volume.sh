#!/usr/bin/env sh

volume_module() {
	[ -n "$command" ] && amixer set Master $command
	mute=$(amixer get Master | grep '\[off\]')

	if [ -n "$mute" ]; then
		volume="muted"
	else
		volume=$(amixer get Master | grep -oP '\[\d+%\]' | head -n 1 | tr -d '[]')
	fi

	echo "$volume"
}
