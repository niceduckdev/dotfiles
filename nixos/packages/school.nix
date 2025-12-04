{ config, pkgs, ... }:

let
	setup-for-college-flake = builtins.getFlake "/home/kaj/dev/setup-for-college";
	setup-for-college = setup-for-college-flake.packages.x86_64-linux.setup-for-college;
in {
	environment.systemPackages = with pkgs; [
    	setup-for-college jetbrains.idea-ultimate
		zed-editor nodejs antlr4
  	];
	
	virtualisation.docker = {
		enable = true;

		daemon.settings = {
    		experimental = true;
			features = {
				buildkit = true;
			};
  		};
	};
}
