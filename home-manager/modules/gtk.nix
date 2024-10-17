{pkgs, ...}: {
home.packages = with pkgs; [
#tokyonight-gtk-theme
#rose-pine-gtk-theme
adw-gtk3
rose-pine-icon-theme 
];
dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      #gtk-theme = "tokyonight-gtk-theme";
      #gtk-theme = pkgs.lib.mkDefault "${import ./gtk-theme.nix {inherit pkgs; }}";
      gtk-theme = pkgs.lib.mkDefault "adw-gtk3-dark";
    };
};
gtk={
enable = true;
theme = {
	name="adw-gtk3-dark";
	#package = pkgs.callPackage ./gtk-theme.nix { };
	package = pkgs.adw-gtk3;
};
iconTheme = {
      name = "rose-pine-icon-theme";
      package = pkgs.rose-pine-icon-theme;
    };

 gtk3.extraConfig = {
        "gtk-application-prefer-dark-theme"="1";
    };

    gtk4.extraConfig = {
        "gtk-application-prefer-dark-theme"="1";
    };

};
home.sessionVariables.GTK_THEME = "Adwaita:dark";
}
