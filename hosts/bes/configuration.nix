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
    ./core.nix
    ../../modules/sops.nix
    ./networking.nix
    ../../modules/ssh.nix
    ../../modules/zsh.nix
    ../../modules/tmux.nix
    ../../modules/nvf.nix
    ./home.nix
    ../../pkgs/holo.nix
    ../../pkgs/meowderator.nix
    ../../modules/mail.nix
    ../../modules/minecraft.nix
    ../../modules/nixarr.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.swraid.enable = true;
  boot.kernelParams = ["boot.shell_on_fail"];

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  sops.secrets."flamin/password".neededForUsers = true;
  users.groups.holo = {};
  users.groups.minecraft = {};
  users.users.flamin = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."flamin/password".path;
    extraGroups = ["wheel" "networkmanager" "holo" "meowderator" "minecraft" "nixarr"];
    packages = pkgList;
  };
  documentation = {
    enable = true;
    dev.enable = true;
  };
   hardware.graphics = {
   enable = true;
   extraPackages = with pkgs; [
     rocmPackages.clr.icd
   ];
 };
}
