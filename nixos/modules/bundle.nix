{pkgs, ...}: {
  imports = [
    ./appimage.nix
    ./bootloader.nix
    ./bootloader-laptop.nix
    ./udev.nix
    ./input.nix
    ./sddm.nix
    ./ssh.nix
    ./zram.nix
    ./env.nix
    ./user.nix
    ./nm.nix
    ./hyprland.nix
    ./trim.nix
    ./bluetooth.nix
    ./pipewire.nix
    ./steam.nix
    ./flatpak.nix
    ./font.nix
    ./noisetorch.nix
    ./wpa.nix
  ];
}
