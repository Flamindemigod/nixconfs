{
  inputs,
  pkgs,
  ...
}: {
  services.displayManager.gdm.enable = true;
  programs.niri.enable = true;
  nixpkgs.overlays = [inputs.niri.overlays.niri];
  programs.niri.package = pkgs.niri-unstable;
  services.gnome.gnome-keyring.enable = true; # secret service

  environment.systemPackages = with pkgs; [
    kitty
    swaylock
    swayidle
    xwayland-satellite
    xdg-desktop-portal-gtk
  ];
}
