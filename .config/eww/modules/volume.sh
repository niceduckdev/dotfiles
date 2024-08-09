#!/bin/sh

[ -n "$command" ] && pamixer $command
mute=$(pamixer --get-mute)

if [ "$mute" = "true" ]; then
      volume="muted"
else
      volume="$(pamixer --get-volume)%"
fi

echo "VOL $volume"
