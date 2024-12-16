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
	environment.etc."issue".text = "beep boop\n";

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
		windowManager.i3 = {
			enable = true;
			extraPackages = with pkgs; [
				rofi i3status i3lock xss-lock
				picom xwallpaper alacritty eza
				maim xclip eww jq brightnessctl flatpak-builder
			];
		};
  		xkb = {
    		layout = "be";
    		variant = "";
  		};
		excludePackages = [ pkgs.xterm ];
  	};

	######################
	###    SERVICES    ###
	######################
	services.tlp.enable = true;
	services.printing.enable = false;
	services.flatpak.enable = true;
	hardware.pulseaudio.enable = true;
	security.rtkit.enable = true;
	virtualisation.virtualbox.host.enable = true;

	xdg.portal.enable = true;
	xdg.portal.extraPortals = with pkgs; [
    	xdg-desktop-portal-kde
  	];
	xdg.portal.config.common.default = "*";

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
		git zsh neovim killall gcc
		zip unzip python3 nodejs
		
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
