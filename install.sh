#!/bin/bash

dots_dir=$PWD
output_dir=$HOME/.config/

dotfiles=("alacritty" "eww" "i3" "nvim" "picom" "rofi" "user-dirs.dirs")

PS3="select option: "

select dotfile in "${dotfiles[@]}" "zshrc" "all"; do
	case $dotfile in
        "alacritty")
			echo "installing $dotfile dotfile"
			ln -s $dots_dir/$dotfile $output_dir/$dotfile
            ;;
        "eww")
			echo "installing $dotfile dotfile"
			ln -s $dots_dir/$dotfile $output_dir/$dotfile
            ;;
        "i3")
			echo "installing $dotfile dotfile"
			ln -s $dots_dir/$dotfile $output_dir/$dotfile
            ;;
        "nvim")
			echo "installing $dotfile dotfile"
			ln -s $dots_dir/$dotfile $output_dir/$dotfile
            ;;
        *)
            echo "option not found"
            ;;
    esac
done

for i in "${dotfiles[@]}"; do
   echo "install dotfiles for"
done
