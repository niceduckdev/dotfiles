#!/bin/bash

dotfiles=("alacritty" "eww" "i3" "nvim" "picom" "rofi" "user-dirs.dirs")

for dotfile in "${dotfiles[@]}"; do
	ln -s "$HOME/dotfiles/$dotfile" "$HOME/.config/"
done

ln -s $HOME/dotfiles/.zshrc $HOME/
