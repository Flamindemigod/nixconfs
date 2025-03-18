{pkgs, ...}: {
  home = {
    pointerCursor = {
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = true;
      };
    };
  };
}
