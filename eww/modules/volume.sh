#!/bin/sh

[ -n "$command" ] && pactl $command
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -oP '(yes|no)')

if [ "$mute" = "yes" ]; then
    volume="muted"
else
    volume="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)"
fi

echo "$volume"
