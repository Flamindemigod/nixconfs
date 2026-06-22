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
    ../../modules/mail.nix
    ../../modules/minecraft.nix
  ];

  # Use GRUB2 as the boot loader.
  # We don't use systemd-boot because Hetzner uses BIOS legacy boot.
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub = {
    enable = true;
    efiSupport = false;
    devices = ["/dev/sda" "/dev/sdb"];
  };

  boot.swraid.enable = true;
  boot.kernelParams = ["boot.shell_on_fail"];

  # The mdadm RAID1s were created with 'mdadm --create ... --homehost=hetzner',
  # but the hostname for each machine may be different, and mdadm's HOMEHOST
  # setting defaults to '<system>' (using the system hostname).
  # This results mdadm considering such disks as "foreign" as opposed to
  # "local", and showing them as e.g. '/dev/md/hetzner:root0'
  # instead of '/dev/md/root0'.
  # This is mdadm's protection against accidentally putting a RAID disk
  # into the wrong machine and corrupting data by accidental sync, see
  # https://bugzilla.redhat.com/show_bug.cgi?id=606481#c14 and onward.
  # We do not worry about plugging disks into the wrong machine because
  # we will never exchange disks between machines, so we tell mdadm to
  # ignore the homehost entirely.
  boot.swraid.mdadmConf = ''
    HOMEHOST <ignore>
  '';

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_GB.UTF-8";

  sops.secrets."flamin/password".neededForUsers = true;
  users.groups.holo = {};
  users.groups.minecraft = {};
  users.users.flamin = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."flamin/password".path;
    extraGroups = ["wheel" "networkmanager" "holo" "minecraft"];
    packages = pkgList;
  };
}
