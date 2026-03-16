{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		zed-editor nodejs go just goose
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
