{ config, pkgs, ... }:

{
	time.timeZone = "Europe/Brussels";
  	i18n.defaultLocale = "en_GB.UTF-8";
  	console.keyMap = "be-latin1";
}
