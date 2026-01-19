{pkgs}: let
  scrcpy = pkgs.callPackage ../../pkgs/scrcpy.nix {};
in
  with pkgs;
    [
      kitty
      feh
      mpv
      firefox
      prismlauncher
      discord # Alternative Client for second account
      pavucontrol
      mediainfo
      scrcpy
      kdePackages.dolphin
      kdePackages.dolphin-plugins
      android-tools
      blockbench
    ]
    ++ [scrcpy]
