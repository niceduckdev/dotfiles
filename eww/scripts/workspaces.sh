#!/bin/bash

function get_active_workspace() {
    echo "$(bspc query -D -d focused --names)"
}

get_active_workspace

bspc subscribe desktop |
while read -r _; do
    get_active_workspace
done

