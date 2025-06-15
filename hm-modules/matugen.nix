{
  config,
  pkgs,
  ...
}: let
  templatePath = ../resources/templates;
in {
  programs.matugen = {
    enable = true;
    # variant = "dark";
    #  wallpaper = ../resources/wallpapers/rover_shorekeeper_by_swd3e2.jpg;
    #  type = "scheme-content";
    #  jsonFormat = "hex";
    #     templates = {
    # #     ags = {
    # #       input_path = "./templates/ags.scss";
    # #       output_path = "~/.config/ags/scss/colors.scss";
    # #     };
    # #
    #   kittty = {
    #     input_path = "${templatePath}/kitty.conf";
    #     output_path = "~/.config/kitty/colors.conf";
    #   };
    #
    #     # gtk3 = {
    #     #   input_path = "../resources/templates/gtk.css";
    #     #   output_path = "~/.config/gtk-3.0/gtk.css";
    #     # };
    #     # gtk4 = {
    #     #   input_path = "../resources/templates/gtk.css";
    #     #   output_path = "~/.config/gtk-4.0/gtk.css";
    #     # };
    #     hyprland = {
    #     input_path = "${templatePath}/hyprland.conf";
    #       output_path = "~/.config/hypr/hyprland-colors.conf";
    #     };
    #  };
  };
  xdg.configFile."matugen/config.toml".source = ../resources/config/matugen.toml;
  # xdg.configFile."kitty/colors.conf".source = "${config.programs.matugen.theme.files}/.config/kitty/colors.conf";
  # xdg.configFile."hypr/hyprland-colors.conf".source = "${config.programs.matugen.theme.files}/.config/hypr/hyprland-colors.conf";
  home.packages = [pkgs.matugen];

  home.file.".local/bin/wal" = {
    text = ''
      #!/bin/sh

      set -eu
      wallpaper=$(${pkgs.coreutils}/bin/readlink -f "$1")

      ${pkgs.matugen}/bin/matugen image ''${wallpaper} 1>/dev/null
    '';

    executable = true;
  };
}
