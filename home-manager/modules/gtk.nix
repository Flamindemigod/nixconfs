{pkgs, ...}: {
  home.packages = with pkgs; [
    #tokyonight-gtk-theme
    #rose-pine-gtk-theme
    rose-pine-icon-theme
  ];
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      #gtk-theme = "tokyonight-gtk-theme";
      #gtk-theme = pkgs.lib.mkDefault "${import ./gtk-theme.nix {inherit pkgs; }}";
    };
  };
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = (
        pkgs.adw-gtk3.overrideAttrs (
          previousAttrs: let
            css = pkgs.fetchurl {
              url = "https://gist.githubusercontent.com/Flamindemigod/b3fac10faaa2e935d782963e0f41c0a0/raw/9424e35d7db3d8dab55dddf1a30dfacbbc92b978/rose-pine.css";
              sha256 = "sha256-U+kJEbupUTfBCW1vZOf7CHrW4LnPRnmrtk8rLMDpJqs=";
            };
          in {
            postInstall =
              (previousAttrs.postInstall or "")
              + ''
                rm $out/share/themes/adw-gtk3-dark/gtk-4.0/gtk.css
                cp ${css} $out/share/themes/adw-gtk3-dark/gtk-4.0/gtk.css
              '';
          }
        )
      );
      #package = pkgs.callPackage ./gtk-theme.nix { };
    };
    iconTheme = {
      name = "rose-pine-icon-theme";
      package = pkgs.rose-pine-icon-theme;
    };

    gtk3.extraConfig = {
      "gtk-application-prefer-dark-theme" = "1";
    };

    gtk4.extraConfig = {
      "gtk-application-prefer-dark-theme" = "1";
    };
  };
}
