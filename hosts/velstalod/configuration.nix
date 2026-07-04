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
    ../../modules/sops.nix
    ../../modules/networking.nix
    ../../modules/bluetooth.nix
    ../../modules/ssh.nix
    ../../modules/fonts.nix
    ../../modules/appimage.nix
    ../../modules/wms/niri.nix
    ../../modules/dms.nix
    ../../modules/zsh.nix
    ../../modules/tmux.nix
    ../../modules/flatpak.nix
    ../../modules/steam.nix
    ./home.nix
  ];

  boot.loader.systemd-boot.enable = true;
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_IN";

  sops.secrets."velvy/password".neededForUsers = true;
  sops.secrets."flamin/password".neededForUsers = true;
  users.mutableUsers = false;

  users.users.velvy = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."velvy/password".path;
    extraGroups = ["wheel" "networkmanager" "i2c"];
    packages = pkgList;
  };

  users.users.flamin = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."flamin/password".path;
    extraGroups = ["wheel"];
  };
  services.displayManager.defaultSession = lib.mkForce "";
}
