{ config, pkgs, ... }:

{
	networking.hostName = "laptoep";
	networking.networkmanager.enable = true;

	networking.firewall = {
  		enable = true;
  		trustedInterfaces = [ "docker0" ];
  		allowedTCPPorts = [ 3334 3335 8080 8081 8082 8083 8084 8085 8086 8087 8088 8089 8090 ];
	};
}
