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
    ../../modules/nvf.nix
    ./home.nix
  ];

  boot.loader.systemd-boot.enable = true;
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  sops.secrets."flamin/password".neededForUsers = true;
  users.users.flamin = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."flamin/password".path;
    extraGroups = ["wheel" "networkmanager" "i2c"];
    packages = pkgList;
  };
  documentation = {
    enable = true;
    dev.enable = true;
  };
}
