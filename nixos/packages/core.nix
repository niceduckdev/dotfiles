{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
    	eza fzf git alacritty librewolf unzip xclip
    	discord grim slurp wl-clipboard cliphist jq
		udiskie
  	];

  	programs.neovim = {
    	enable = true;
    	defaultEditor = true;
  	};
}
