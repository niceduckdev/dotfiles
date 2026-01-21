{ config, pkgs, ... }:

{

	services.gnome.gnome-keyring.enable = true;
	programs.sway = {
    	enable = true;
    	wrapperFeatures.gtk = true;
  	};

	environment.variables.TERMINAL = "alacritty";
  
	security.sudo.extraConfig = ''
    	Defaults pwfeedback
  	'';

	environment.etc."issue".text = "logging in to laptoep\n";

  	services.tlp.enable = true;
	fonts.packages = with pkgs; [ mononoki ];
}
