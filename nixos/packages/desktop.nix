{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
    	bspwm sxhkd rofi picom xwallpaper eww alsa-utils brightnessctl
	];

	services.xserver.excludePackages = with pkgs; [ xterm ];
}
