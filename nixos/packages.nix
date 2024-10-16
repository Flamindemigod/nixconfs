{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    wofi
    mpv
    gparted
    pcmanfm-qt
    kitty

    # Coding stuff
    gnumake
    gcc
    nodejs
    python
    (python3.withPackages (ps: with ps; [ requests ]))

    # CLI utils
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
    ranger
    zram-generator
    cava
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
    cliphist
    
    # WMs and stuff
    hyprland
    seatd
    xdg-desktop-portal-hyprland
    waybar
    waybar-mpris
    playerctl
    zscroll

    # Sound
    pipewire
    pulseaudio
    pamixer

    # GPU stuff 
    #amdvlk
    #rocm-opencl-icd
    #glaxnimate

    # Screenshotting
    grim
    grimblast
    slurp

    #sddm
    libsForQt5.qtquickcontrols2 
    libsForQt5.qtgraphicaleffects

#aagl

    # Other
    home-manager
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    papirus-nord
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
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
