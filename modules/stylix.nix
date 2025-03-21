{pkgs, ...}: let
  wallpaperDir = ../resources/wallpapers;
  files = builtins.attrNames (builtins.readDir wallpaperDir);
  randomIndex = builtins.mod (builtins.hashString "md5" "some-seed") builtins.length files;
  bgImage = builtins.elemAt files randomIndex;
  size = "1920x1080";
in {
  stylix = {
    enable = true;
    polarity = "dark";
    image = pkgs.runCommand "bg.png" {} ''
      ${pkgs.imagemagick}/bin/magick "${bgImage}" -resize ${size} $out
    '';
    fonts = {
      serif = {
        package = pkgs.fira-code;
        name = "FiraCode Nerd Font";
      };
      sansSerif = {
        package = pkgs.fira-code;
        name = "FiraCode Nerd Font";
      };
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sizes = {
        applications = 12;
        desktop = 10;
        popups = 10;
        terminal = 12;
      };
    };
    cursor = {
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 16;
    };
  };
}
