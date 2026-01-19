{
  pkgs,
  nixpkgs,
  ...
}: {
  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];
  console = {
    font = "Lat2-Terminus32";
    keyMap = "uk";
  };
 security.rtkit.enable = true; 
 services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.libinput.enable = true;
  programs.noisetorch.enable = true;
  environment.systemPackages = with pkgs; [
    kitty
    vim
    wget
    git
    tmux
    fd
    ripgrep
    parted
    zip
    unzip
    p7zip
  ];

  nixpkgs.config.allowUnfree = true;
  environment = {
    variables = {
      EDITOR = "vim";
    };
    sessionVariables = {
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
      GDK_BACKEND="wayland";	
    };
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    randomizedDelaySec = "14m";
    options = "--delete-older-than 10d";
  };
}
