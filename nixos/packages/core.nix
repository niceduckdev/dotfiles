{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
    	eza fzf git alacritty librewolf unzip xclip
    	discord
  	];

  	programs.neovim = {
    	enable = true;
    	defaultEditor = true;
  	};
}
