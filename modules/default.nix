{
  inputs,
  pkgs,
  ...
}: let
in {
  imports = [
    ./appimage.nix
    ./audio.nix
    ./bluetooth.nix
    ./env.nix
    ./flatpak.nix
    ./hyprland.nix
    ./input.nix
    ./nm.nix
    ./sddm.nix
    ./ssh.nix
    ./steam.nix
    ./font.nix
    ./stylix.nix
    ./trim.nix
    ./udev.nix
    ./user.nix
    ./wpa.nix
    ./zram.nix
    ./vm.nix
    ./sunshine.nix
  ];
}
