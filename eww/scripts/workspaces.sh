#!/bin/bash

function get_active_workspace() {
	echo "$(echo $(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name'))"
}

get_active_workspace

i3-msg -t subscribe -m '{"type":"workspace"}' |
while read -r _; do
	get_active_workspace
done
