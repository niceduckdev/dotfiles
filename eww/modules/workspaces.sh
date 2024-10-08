#!/bin/sh

contains() {
    for e in $1; do
        [ "$e" -eq "$2" ] && echo 1 && return
    done
    echo 0
}

print_workspaces() {
    output=""
    desktops=$(bspc query -D --names)
    focused_desktop=$(bspc query -D -d focused --names)
    occupied_desktops=$(bspc query -D -d .occupied --names)

    for desktop in $desktops; do
        if [ "$(contains "$focused_desktop" "$desktop")" -eq 1 ]; then
            class="focus"
        elif [ "$(contains "$occupied_desktops" "$desktop")" -eq 1 ]; then
            class="open"
        else
            class="empty"
        fi

        output="$output (eventbox :cursor \"pointer\" (button :class \"workspace-button $class\" :onclick \"bspc desktop -f $desktop\" \"$desktop\"))"
    done

    echo "(box :spacing \"10\" :halign \"center\" :valign \"center\" :space-evenly false $output)"
}

print_workspaces
bspc subscribe desktop node_transfer | while read -r _ ; do
    print_workspaces
done
