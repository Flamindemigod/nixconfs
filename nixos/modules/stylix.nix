{pkgs, ...}: {
  stylix = {
    enable = true;
    image = ../../resources/37-sophia-by-kurohush.jpg;
    base16Scheme = ../../resources/37-scheme.yaml;
    polarity = "dark";
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
    targets = {
      chromium.enable = true;
      console.enable = true;
      feh.enable = true;
      gnome.enable = true;
      gtk.enable = true;
      nixos-icons.enable = true;
      qt.enable = true;
      spicetify.enable = true;
    };
  };
}
