{
  inputs,
  pkgs,
  ...
}: {
  programs.niri.enable = true;
  nixpkgs.overlays = [inputs.niri.overlays.niri];
  programs.niri.package = pkgs.niri-unstable;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };
  environment.systemPackages = with pkgs; [
    kitty
    swaylock
    swayidle
    xwayland-satellite
    nautilus
    xdg-desktop-portal-gnome
  ];
}
