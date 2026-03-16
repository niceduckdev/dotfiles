{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
     	apple-cursor papirus-icon-theme gnome-tweaks
		gnomeExtensions.just-perfection
		gnomeExtensions.launch-new-instance
		adw-gtk3
    ];
}
