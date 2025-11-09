{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		eza git alacritty librewolf unzip xclip
		discord
  	];

  	programs.neovim = {
    	enable = true;
    	defaultEditor = true;
  	};
}
