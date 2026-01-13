{inputs, pkgs, ...}:{
 	services.displayManager.gdm.enable = true;	
	programs.niri.enable = true;
  	nixpkgs.overlays = [ inputs.niri.overlays.niri ];
	programs.niri.package = pkgs.niri-unstable;	
	security.polkit.enable = true; # polkit
	services.gnome.gnome-keyring.enable = true; # secret service
	security.pam.services.swaylock = {};

	environment.systemPackages = with pkgs; [ 
		kitty 
		swaylock 
		swayidle
		xwayland-satellite
		xdg-desktop-portal-gnome
		xdg-desktop-portal-gtk 
	];
}
