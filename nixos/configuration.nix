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
		./packages/school.nix
		./packages/dev.nix
  	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
  	nixpkgs.config.allowUnfree = true;
  	system.stateVersion = "25.05";
}
