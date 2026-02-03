{ config, pkgs, ... }:

let
	bar-modules-flake = builtins.getFlake "/home/kaj/dotfiles/eww/logic";
	bar-modules = bar-modules-flake.packages.x86_64-linux.bar-modules; 
in {
	environment.systemPackages = with pkgs; [
    	rofi-wayland eww alsa-utils brightnessctl
		ufetch bar-modules apple-cursor
	];

	programs.foot.enable = false;
}
