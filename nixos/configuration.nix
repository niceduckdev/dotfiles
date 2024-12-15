{ config, pkgs, ... }:

{
	imports = [ ./hardware-configuration.nix ];

	########################
	###    BOOTLOADER    ###
	########################
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	########################
	###    NETWORKING    ###
	########################
	networking.hostName = "laptoep";
	networking.networkmanager.enable = true;
	hardware.bluetooth.enable = false;

	#############################
	###    TIME & KEYBOARD    ###
	#############################
	time.timeZone = "Europe/Brussels";
	i18n.defaultLocale = "en_GB.UTF-8";
	console.keyMap = "be-latin1";
	
	#####################
	###    XSERVER    ###
	#####################
	services.xserver = {
  		enable = true;
		displayManager.startx.enable = true;
        desktopManager.xterm.enable = false;
		windowManager.i3 = {
			enable = true;
			extraPackages = with pkgs; [
				rofi i3status i3lock xss-lock
				picom xwallpaper alacritty
				maim xclip eww jq brightnessctl
			];
		};
  		xkb = {
    		layout = "be";
    		variant = "";
  		};
  	};

	######################
	###    SERVICES    ###
	######################
	services.tlp.enable = true;
	services.printing.enable = true;
	services.flatpak.enable = true;
	hardware.pulseaudio.enable = true;
	security.rtkit.enable = true;
	virtualisation.virtualbox.host.enable = true;

	xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-kde ];
	xdg.portal.enable = true;

	###################
	###    USERS    ###
	###################
  	users.users.kaj = {
    	isNormalUser = true;
    	description = "kaj";
    	extraGroups = [ "networkmanager" "wheel" "dialout" ];
  	};
  	users.defaultUserShell = pkgs.zsh;

	######################
	###    PACKAGES    ###
	######################
  	nixpkgs.config.allowUnfree = true;
  	programs.firefox.enable = true;
  	programs.zsh.enable = true;
  	environment.systemPackages = with pkgs; [
		git zsh neovim killall eza pfetch gcc
		discord zip unzip papirus-icon-theme fzf
		python3 vscodium nodejs spotify
		
		obsidian jetbrains.rider ciscoPacketTracer8
		dotnetCorePackages.sdk_8_0_2xx
		mono umlet ipcalc jetbrains.jdk
  	]; 
  	fonts.packages = with pkgs; [
		fira-code-nerdfont
	];

	###################################
	###    NIXOS (DO NOT CHANGE)    ###
	###################################
  	system.stateVersion = "24.05";
}
