{
  pkgs,
  lib,
  ...
}: {
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
      wofi.enable = true;
      waybar = {
        enable = true;
        enableCenterBackColors = true;
        addCss = true;
      };
      vesktop.enable = true;
      tmux.enable = true;
      neovim.enable = false;
      mangohud.enable = false;
      kitty.enable = true;
      kitty.variant256Colors = true;
      hyprpaper.enable = true;
      hyprland.enable = true;
      gtk.flatpakSupport.enable = true;
      firefox.enable = true;
      dunst.enable = true;
      btop.enable = true;
    };
  };
}
