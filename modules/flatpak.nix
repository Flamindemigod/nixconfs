{pkgs, ...}: {
  services.flatpak.enable = true;
  xdg.autostart.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    config.common.default = "gtk";
  };
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    script = ''
      ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      ${pkgs.flatpak}/bin/flatpak update
    '';
  };
}
