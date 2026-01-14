{
  pkgs,
  nixpkgs,
  ...
}: {
  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];
  networking.networkmanager.enable = true;
  console = {
    font = "Lat2-Terminus32";
    keyMap = "uk";
  };
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.libinput.enable = true;

  environment.systemPackages = with pkgs; [
    kitty
    vim
    wget
    git
    tmux
  ];

  services.openssh.enable = true;
  nixpkgs.config.allowUnfree = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    randomizedDelaySec = "14m";
    options = "--delete-older-than 10d";
  };
}
