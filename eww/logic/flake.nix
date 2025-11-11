{
  description = "modules for my eww bar";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.bar-modules;

    packages.x86_64-linux.bar-modules =
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        name = "bar-modules";

        batteryScript = builtins.readFile (self + "/battery.sh");
        dateScript = builtins.readFile (self + "/date.sh");
        networkScript = builtins.readFile (self + "/network.sh");
        timeScript = builtins.readFile (self + "/time.sh");
        volumeScript = builtins.readFile (self + "/volume.sh");
        workspacesScript = builtins.readFile (self + "/workspaces.sh");

        logicScriptWithoutSources = builtins.replaceStrings [
          "source ./battery.sh\n" "source ./date.sh\n" "source ./network.sh\n"
          "source ./time.sh\n" "source ./volume.sh\n" "source ./workspaces.sh\n"
        ] [ "" "" "" "" "" "" ] (builtins.readFile (self + "/logic.sh"));

		combinedScript = ''
			${batteryScript}
			${dateScript}
			${networkScript}
			${timeScript}
			${volumeScript}
			${workspacesScript}
			${logicScriptWithoutSources}
        '';

        script = pkgs.writeShellScriptBin name combinedScript;
        buildInputs = with pkgs; [ networkmanager alsa-utils bspwm ];
      in pkgs.symlinkJoin {
        name = name;
        paths = [ script ] ++ buildInputs;
        buildInputs = [ pkgs.makeWrapper ];
        postBuild = "wrapProgram $out/bin/${name} --prefix PATH : $out/bin";
      };
  };
}
