{
  pkgs,
  lib,
  ...
}: let
  ##bgImage = ../resources/wallpapers/__herta_and_the_herta_honkai_and_1_more_drawn_by_niukou_kouzi__sample-e0de37fb0ac3173d9426c915128fdb7c.jpg;
  bgImage = ../resources/wallpapers/lupa.png;
in {
  stylix = {
    enable = true;
    polarity = "dark";
    image = pkgs.runCommand "bg.png" {} ''
      ${pkgs.imagemagick}/bin/magick "${bgImage}" -resize "1920x1080" $out
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
      package = lib.mkForce pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 16;
    };
    #targets.neovim.enable = false;
  };
}
