{ config, lib, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
  		eza fzf git alacritty librewolf
		discord	spotify
	];

  	programs.neovim = {
    	enable = true;
    	defaultEditor = true;
  	};
}
