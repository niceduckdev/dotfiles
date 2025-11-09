{ config, pkgs, ... }:

{
	users.users.kaj = {
    	isNormalUser = true;
    	description = "kaj";
    	extraGroups = [ "networkmanager" "wheel" ];
    	shell = pkgs.zsh;
  	};

  	programs.zsh.enable = true;
}
