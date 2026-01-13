{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  nix.settings.experimental-features = ["flakes"];  

  networking.hostName = "satis"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus32";
    keyMap = "uk";
  };

  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;

  environment.cosmic.excludePackages = with pkgs; [
	cosmic-edit #We gots vim
  ];

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.flamin = {
  	isNormalUser = true;
  	extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  	packages = with pkgs; [
    		kitty
		mpv
		swaybg	
	];
  };

  environment.pathsToLink = [
	"/share/backgrounds/cosmic"
	"/share/cosmic/"  
  ];

  environment.systemPackages = with pkgs; [
      		vim
		wget
		git
		tmux
		cosmic-bg
		cosmic-wallpapers
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "25.11"; #Never Change This!! 

}

