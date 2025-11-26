{
  inputs,
  pkgs,
  ...
}: let
  gpuIDs = [
    "28:00.0" #Graphics
    "28:00.1" #Audio
  ];
in {
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../modules/bootloader.nix
    ./packages.nix
  ];

  #Module Overrides
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_17;
  boot.initrd.kernelModules = ["amdgpu"];
  boot.kernelParams = [
    "video=HDMI-A-1:1920x1080@60"
    "video=DP-1:1440x900@60"
    "video=DP-3:1440x900@60"
    "iommu=pt"
    "intel_iommu=on"
    "pcie_acs_override=downstream,multifunction"
    ("vfio-pci.ids=" + builtins.concatStringsSep "," gpuIDs)
  ];
  networking.hostName = "hathor"; # Define your hostname.

  system.stateVersion = "23.05"; # Don't change it bro

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ]; # Enabling flakes

    substituters = [
      "https://hyprland.cachix.org" #Hyprland
      "https://ezkea.cachix.org" #Anime Game Launcher Stuff
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
    ];
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    randomizedDelaySec = "14m";
    options = "--delete-older-than 10d";
  };

  time.timeZone = "Europe/London";

  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (
        subject.isInGroup("users")
          && (
            action.id == "org.freedesktop.login1.reboot" ||
            action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
            action.id == "org.freedesktop.login1.power-off" ||
            action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          )
        )
      {
        return polkit.Result.YES;
      }
    });
  '';
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
        user="flamin";
      };
    };
  };
}
