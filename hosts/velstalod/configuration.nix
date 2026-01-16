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
    ../../modules/networking.nix
    ../../modules/bluetooth.nix
    ../../modules/ssh.nix
    ../../modules/fonts.nix
    ../../modules/appimage.nix
    ../../modules/wms/niri.nix
    ../../modules/dms.nix
    ../../modules/zsh.nix
    ../../modules/tmux.nix
    ./home.nix
  ];

  boot.loader.systemd-boot.enable = true;
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_IN";
  
  users.users.velvy = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = pkgList;
  };

  users.users.flamin = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };
}
