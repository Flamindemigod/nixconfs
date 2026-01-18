{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: let
  pkgList = import ./packages.nix {inherit pkgs;};
in {
  #Module Includes
  imports = [
    ./hardware-configuration.nix
    ../../modules/core.nix
    ../../modules/bluetooth.nix
    ../../modules/networking.nix
    ../../modules/ssh.nix
    ../../modules/fonts.nix
    ../../modules/appimage.nix
    ../../modules/wms/niri.nix
    ../../modules/dms.nix
    ../../modules/zsh.nix
    ../../modules/tmux.nix
    ../../modules/steam.nix
    ../../modules/flatpak.nix
    ./home.nix
  ];
  powerManagement.enable = true;
  services.upower.enable = true;
  boot.loader.systemd-boot.enable = true;
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  users.users.flamin = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = pkgList;
  };
}
