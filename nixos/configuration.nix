{ config, pkgs, ... }:

{
  imports = [
		./hardware-configuration.nix
    	./system/boot.nix
    	./system/networking.nix
    	./system/locale.nix
    	./system/audio.nix
    	./users.nix
    	./desktop.nix
    	./packages/core.nix
    	./packages/desktop.nix
  ];

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
}
