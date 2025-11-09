{ config, pkgs, ... }:

{
	services.xserver = {
		enable = true;

		desktopManager.xterm.enable = false;
  		displayManager.startx = {
    		enable = true;
    		generateScript = true;
  		};
  		xkb.layout = "be";
	};

	environment.variables.TERMINAL = "alacritty";
  
	security.sudo.extraConfig = ''
    	Defaults pwfeedback
  	'';

	environment.etc."issue".text = "logging in to laptoep\n";

  	services.tlp.enable = true;
	fonts.packages = with pkgs; [ mononoki ];
}
