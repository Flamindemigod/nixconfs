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
  services.transmission = {
    enable = true;
    package = pkgs.transmission_4;
    user = "flamin";
    webHome = pkgs.flood-for-transmission;
    openRPCPort = true; #Open firewall for RPC
    settings = {
      incomplete-dir-enabled = false;
      download-dir = "/home/flamin/Desktop/Transmission";
      #Override default settings
      rpc-bind-address = "0.0.0.0"; #Bind to own IP
      rpc-whitelist = "127.0.0.1"; #Whitelist your remote machine (10.0.0.1 in this example)
    };
  };
}
