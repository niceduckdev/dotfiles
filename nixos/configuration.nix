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
				networkmanagerapplet maim xclip
				eww jq brightnessctl
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
	hardware.pulseaudio.enable = true;
	security.rtkit.enable = true;
	virtualisation.virtualbox.host.enable = true;

	###################
	###    USERS    ###
	###################
  	users.users.kaj = {
    	isNormalUser = true;
    	description = "kaj";
    	extraGroups = [ "networkmanager" "wheel" ];
  	};
  	users.defaultUserShell = pkgs.zsh;

	######################
	###    PACKAGES    ###
	######################
  	nixpkgs.config.allowUnfree = true;
  	programs.firefox.enable = true;
  	programs.zsh.enable = true;
  	environment.systemPackages = with pkgs; [
		git zsh neovim killall eza pfetch gh
		glab gcc discord zip unzip pcmanfm
		lxappearance papirus-icon-theme htop
		
		obsidian jetbrains.rider jetbrains.idea-ultimate
		ciscoPacketTracer8 dotnetCorePackages.sdk_8_0_2xx
		mono umlet 
  	];
  	fonts.packages = with pkgs; [
		fira-code
	];

	###################################
	###    NIXOS (DO NOT CHANGE)    ###
	###################################
  	system.stateVersion = "24.05";
}
