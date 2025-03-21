{pkgs, ...}: let
  sddmTheme = import ./sddm-theme.nix pkgs;
in {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${sddmTheme}";
  };
}
