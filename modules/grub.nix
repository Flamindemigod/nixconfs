{
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.grub.devices = [
    "/dev/disk/by-uuid/5fb5a33d-93e7-496f-9eca-b96e7c751409"
  ];
}
