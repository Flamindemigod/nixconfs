{
  nixpkgs,
  home-manager,
  stylix,
  inputs,
  ...
}:
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    ./configuration.nix
    stylix.nixosModules.stylix
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.jdoe = import ../../home-manager/home.nix;

      # Optionally, use home-manager.extraSpecialArgs to pass
      # arguments to home.nix
    }
    {
      imports = [aagl.nixosModules.default];
      nix.settings = aagl.nixConfig; # Set up Cachix
      programs.anime-game-launcher.enable = false; # Adds launcher and /etc/hosts rules
      programs.honkers-railway-launcher.enable = true;
      programs.honkers-launcher.enable = false;
      programs.sleepy-launcher.enable = false;
    }
    {
      imports = [inputs.spicetify-nix.nixosModules.default];
      programs.spicetify = {
        enable = true;
        enabledExtensions = with spicePkgs.extensions; [
          adblockify
          hidePodcasts
          shuffle # shuffle+ (special characters are sanitized out of extension names)
        ];
      };
    }
  ];
}
