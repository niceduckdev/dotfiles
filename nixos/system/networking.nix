{ config, pkgs, ... }:

{
	networking.hostName = "laptoep";
	networking.networkmanager.enable = true;
}
