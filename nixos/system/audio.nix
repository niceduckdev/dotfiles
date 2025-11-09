{ config, pkgs, ... }:

{
	services.pulseaudio.enable = true;
	services.pipewire.enable = false;
}
