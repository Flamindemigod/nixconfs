{
  pkgs,
  lib,
  options,
  ...
}: {
  programs.dank-material-shell = {
    enable = true;
    plugins = {
      mediaPlayer.enable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5ct
    kdePackages.qt6ct
  ];
}
