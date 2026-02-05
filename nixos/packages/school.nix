{ config, pkgs, ... }:

let
	setup-for-college-flake = builtins.getFlake "/home/kaj/dev/setup-for-college";
	setup-for-college = setup-for-college-flake.packages.x86_64-linux.setup-for-college;
in {
	environment.systemPackages = with pkgs; [
    	setup-for-college
		antlr4 postgresql_17_jit
		teams-for-linux
  	];
}
