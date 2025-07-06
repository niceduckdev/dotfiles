#!/usr/bin/env bash

function get_active_workspace() {
    bspc query -D -d focused --names
}

function get_workspaces() {
    active=$(get_active_workspace)
    output="(box :spacing 15 :space-evenly false"

    for ws in $(bspc query -D --names | xargs); do
        if [ "$ws" = "$active" ]; then
            output="$output (label :class 'active' :text '$ws')"
        else
            output="$output (label :text '$ws')"
        fi
    done

    output="$output)"
    echo "$output"
}

get_workspaces

bspc subscribe desktop | while read -r _; do
    get_workspaces
done
