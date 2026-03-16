{ config, pkgs, ... }:

{
    services.xserver.displayManager.gdm = {
        enable = true;
        wayland = true;
    };

  	services.xserver = {
    	layout = "be";
  	};

    services.xserver.desktopManager.gnome.enable = true;
    services.gnome.core-developer-tools.enable = false;
    services.gnome.games.enable = false;
    environment.gnome.excludePackages = with pkgs; [
        gnome-tour gnome-user-docs
        epiphany gedit
    ];

    environment.variables.TERMINAL = "alacritty";

    security.sudo.extraConfig = ''
        Defaults pwfeedback
    '';
    environment.etc."issue".text = "logging in to laptoep\n";
    fonts.packages = with pkgs; [ mononoki texlivePackages.nunito ];
}
