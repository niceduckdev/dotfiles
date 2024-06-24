#!/bin/sh

setxkbmap -layout be
picom -b &
feh --bg-scale /home/kaj/.wallpapers/kamp-2023.jpg &
/home/kaj/dotfiles/.scripts/bar.sh &
exec /home/kaj/dwm/dwm
