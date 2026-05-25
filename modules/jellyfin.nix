{pkgs, ...}: {
  services.jellyfin = {
    enable = true;
  };
  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellfin-ffmpeg
    pkgs.jellyfin-web
  ];
}
