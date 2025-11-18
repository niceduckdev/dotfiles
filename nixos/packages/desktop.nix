{ config, pkgs, ... }:

let
	bar-modules-flake = builtins.getFlake "/home/kaj/dotfiles/eww/logic";
	bar-modules = bar-modules-flake.packages.x86_64-linux.bar-modules; 
in {
	environment.systemPackages = with pkgs; [
    	bspwm sxhkd rofi picom xwallpaper
		eww alsa-utils brightnessctl maim
		ufetch bar-modules apple-cursor
	];

	services.xserver.excludePackages = with pkgs; [ xterm ];
}
