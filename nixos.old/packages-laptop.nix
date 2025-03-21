{
  pkgs,
  lib,
  config,
  spicetify-nix,
  ...
}: let
  patchDesktop = pkg: appName: from: to:
    lib.hiPrio (
      pkgs.runCommand "$patched-desktop-entry-for-${appName}" {} ''
        ${pkgs.coreutils}/bin/mkdir -p $out/share/applications
        ${pkgs.gnused}/bin/sed 's#${from}#${to}#g' < ${pkg}/share/applications/${appName}.desktop > $out/share/applications/${appName}.desktop
      ''
    );

  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
  GPUOffloadApp = pkg: desktopName:
    lib.mkIf config.hardware.nvidia.prime.offload.enable
    (patchDesktop pkg desktopName "^Exec=" "Exec=nvidia-offload ");
in {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "python-2.7.18.8"
      "electron-25.9.0"
    ];
  };

  environment.systemPackages = with pkgs; [
    nvidia-offload
    (callPackage ./packages/OkBob.nix {})
    (GPUOffloadApp steam "steam")
    localsend
    nil
    nixfmt-rfc-style
    # Desktop apps
    wofi
    mpv
    gparted
    pcmanfm-qt
    kitty
    libresprite
    #blender-hip

    # Coding stuff
    gnumake
    gcc
    nodejs
    zig
    zls
    python
    (python3.withPackages (ps: with ps; [requests]))

    tmux
    tmuxPlugins.sensible
    tmuxPlugins.rose-pine
    tmuxPlugins.resurrect
    tmuxPlugins.continuum

    # CLI utils
    neovim
    vim
    file
    tree
    wget
    git
    fastfetch
    btop
    htop
    nix-index
    unzip
    ffmpeg
    light
    lux
    mediainfo
    lf
    zip
    ntfs3g
    yt-dlp
    brightnessctl
    openssl
    lazygit
    bluez
    bluez-tools

    # GUI utils
    feh
    imv
    dmenu
    dunst
    firefox-devedition

    # Xorg stuff
    #xterm
    #xclip
    #xorg.xbacklight

    # Wayland stuff
    xwayland
    wl-clipboard
    (cliphist.overrideAttrs (_old: {
      src = pkgs.fetchFromGitHub {
        owner = "sentriz";
        repo = "cliphist";
        rev = "c49dcd26168f704324d90d23b9381f39c30572bd";
        sha256 = "sha256-2mn55DeF8Yxq5jwQAjAcvZAwAg+pZ4BkEitP6S2N0HY=";
      };
      vendorHash = "sha256-M5n7/QWQ5POWE4hSCMa0+GOVhEDCOILYqkSYIGoy/l0=";
    }))
    # WMs and stuff
    kdePackages.polkit-kde-agent-1
    seatd
    waybar
    waybar-mpris
    playerctl
    zscroll
    xdotool

    # Sound
    pipewire
    pulseaudio
    pamixer
    pavucontrol

    # GPU stuff
    #amdvlk
    #rocmPackages.rocm-smi
    #rocm-opencl-icd
    glaxnimate
    lshw

    # Screenshotting
    grim
    grimblast
    slurp

    #sddm
    libsForQt5.qtquickcontrols2
    libsForQt5.qtgraphicaleffects

    vesktop
    (discord-canary.override {
      #withOpenASAR = true; # can do this here too
      withVencord = true;
    })
    keepassxc
    # Other
    home-manager
    libsForQt5.qt5ct
    nixfmt-rfc-style
    gtk4
    prismlauncher

    usbutils
    udiskie
    udisks

    #Gstreamer
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-libav
  ];

  fonts.packages = with pkgs; [
    liberation_ttf
    fira-code
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.symbols-only
  ];
}
