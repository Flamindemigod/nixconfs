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
    hyprland
    hyprpaper
    hyprpicker
    hypridle
    kdePackages.polkit-kde-agent-1
    seatd
    xdg-desktop-portal-hyprland
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
    rocm-opencl-icd
    glaxnimate

    # Screenshotting
    grim
    grimblast
    slurp

    #sddm
    libsForQt5.qtquickcontrols2 
    libsForQt5.qtgraphicaleffects

    vesktop
    hyprpicker
    keepassxc
    # Other
    home-manager
    libsForQt5.qt5ct
    nixfmt-rfc-style
    gtk4
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
