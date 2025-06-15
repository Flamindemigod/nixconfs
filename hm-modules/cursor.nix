{
  pkgs,
  lib,
  ...
}: {
  home = {
    pointerCursor = {
      package = lib.mkDefault pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 16;
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = true;
      };
    };
  };
}
