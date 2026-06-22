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
  programs.direnv.enable = true;
  programs.direnv.silent = true;
  environment.systemPackages = with pkgs; [
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

  #nixpkgs.config.allowUnfree = true;
  environment = {
    variables = {
      EDITOR = "vim";
    };
    sessionVariables = {
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
    };
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    randomizedDelaySec = "14m";
    options = "--delete-older-than 10d";
  };
}
