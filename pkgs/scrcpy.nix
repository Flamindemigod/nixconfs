#Small script to launch a Scrcpy window with specific options
{pkgs, ...}:
pkgs.stdenv.mkDerivation rec {
  name = "scrcpy";
  buildCommand = let
    script = pkgs.writeShellScriptBin name ''
       		${pkgs.scrcpy}/bin/scrcpy --render-driver=opengl \
      -K --mouse=sdk --window-borderless       \
      --audio-source=output -w
    '';
    desktopEntry = pkgs.makeDesktopItem {
      name = name;
      exec = "${script}/bin/${name}";
      desktopName = "Scrcpy Wrapped";
      categories = ["Utility"];
    };
  in ''
    mkdir -p $out/bin
    cp ${script}/bin/${name} $out/bin/
    mkdir -p $out/share/applications
    cp ${desktopEntry}/share/applications/${name}.desktop $out/share/applications/
  '';
  dontBuild = true;
  meta = {
    description = "A General Purpose Wrapped Scrcpy Script";
  };
}
