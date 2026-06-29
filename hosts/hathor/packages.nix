{pkgs}: let
  scrcpy = pkgs.callPackage ../../pkgs/scrcpy.nix {};
in
  with pkgs;
    [
      kitty
      feh
      mpv
      brave
      (equibop.overrideAttrs {
        equicord = pkgs.equicord;
      }) #Modified Vesktop Client
      prismlauncher
      (discord.override {
        # withOpenASAR = true; # can do this here too
        withVencord = true;
      })
      pavucontrol
      mangohud
      ffmpeg
      mediainfo
      thunderbird
      bitwarden-desktop
      easyeffects
      man-pages
      man-pages-posix
    ]
    ++ [scrcpy]
