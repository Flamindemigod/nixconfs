{pkgs, ...}:{
  qt = {
    enable = true;
  # platformTheme.name = "qtct";
   # style.name = "kvantum";
platformTheme.name = "gtk";
	style.name = "adwaita-dark";
  style.package = pkgs.adwaita-qt;
};

  # xdg.configFile = {
  #   "Kvantum/kvantum.kvconfig".text = ''
  #     [General]
  #     theme=GraphiteNordDark
  #   '';
  #
  #   "Kvantum/GraphiteNord".source = "${pkgs.graphite-kde-theme}/share/Kvantum/GraphiteNord";
  # };
}
