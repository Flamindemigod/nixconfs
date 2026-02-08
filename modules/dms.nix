{
  pkgs,
  lib,
  options,
  ...
}: {
  programs.dank-material-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    enableSystemMonitoring = true;
    enableVPN = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5ct
    kdePackages.qt6ct
  ];
}
