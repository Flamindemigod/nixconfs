{pkgs}: let
  scrcpy = pkgs.callPackage ../../pkgs/scrcpy.nix {};
in
  with pkgs;
    [
      kitty
      feh
      mpv
      brave
      equibop #Modified Vesktop Client
      prismlauncher
      discord # Alternative Client for second account
      pavucontrol
      mangohud
      ffmpeg
      mediainfo
      thunderbird
      bitwarden-desktop
    ]
    ++ [scrcpy]
