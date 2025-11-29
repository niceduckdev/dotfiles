{ config, pkgs, ... }:

{
	users.users.kaj = {
    	isNormalUser = true;
    	description = "kaj";
    	extraGroups = [ "networkmanager" "wheel"  "docker"];
    	shell = pkgs.zsh;
  	};

  	programs.zsh.enable = true;
}
