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
    ../../modules/fonts.nix
    ../../modules/wms/niri.nix
    ../../modules/dms.nix
    ../../modules/zsh.nix
    ./home.nix
  ];

  boot.loader.systemd-boot.enable = true;
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  users.users.flamin = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = pkgList;
  };
}
