#!/usr/bin/env bash

function get_active_workspace() {
    swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true).name'
}

function get_workspaces() {
    active=$(get_active_workspace)
    output="(box :spacing 15 :space-evenly false"
	workspaces="one two three four five"

    for ws in $workspaces; do
        if [ "$ws" = "$active" ]; then
            output="$output (eventbox :cursor 'pointer' :onclick 'swaymsg workspace $ws' (label :class 'active' :text '$ws'))"
        else
            output="$output (eventbox :cursor 'pointer' :onclick 'swaymsg workspace $ws' (label :text '$ws'))"
        fi
    done

    output="$output)"
    echo "$output"
}

workspaces_module() {
    get_workspaces

    swaymsg -t subscribe -m '["workspace"]' | while read -r _; do
        get_workspaces
    done
}
