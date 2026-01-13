{pkgs, ...}:{
	programs.niri.enable = true;

	security.polkit.enable = true; # polkit
	services.gnome.gnome-keyring.enable = true; # secret service
	security.pam.services.swaylock = {};

	environment.systemPackages = with pkgs; [ alacrity kitty fuzzel swaylock mako swayidle ];

}
