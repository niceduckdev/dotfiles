#!/usr/bin/env sh

contains() {
    for e in $1; do
        [ "$e" -eq "$2" ] && echo 1 && return
    done
    echo 0
}

print_workspaces() {
    output=""
    desktops=$(xprop -root _NET_DESKTOP_NAMES | awk -F\" '{for (i=2; i<NF; i+=2) print $i}')
    current=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $NF}')
    occupied=$(xprop -root _NET_CLIENT_LIST | wc -l)

    index=0
    for desktop in $desktops; do
        if [ "$index" -eq "$current" ]; then
            class="focus"
        elif [ $occupied -gt 0 ]; then
            class="open"
        else
            class="empty"
        fi

        output="$output (eventbox :cursor \"pointer\" (button :class \"workspace-button $class\" :onclick \"i3-msg workspace $desktop\" \"$desktop\"))"
        index=$((index + 1))
    done

    echo "(box :spacing \"10\" :halign \"center\" :valign \"center\" :space-evenly false $output)"
}

print_workspaces &
while xprop -spy -root _NET_DESKTOP_NAMES _NET_CURRENT_DESKTOP; do
    print_workspaces
done
