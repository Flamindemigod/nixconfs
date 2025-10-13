{
  nixpkgs,
  inputs,
  ...
}: let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
  nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs;};
    system = "x86_64-linux";
    modules = [
      inputs.stylix.nixosModules.stylix
      inputs.home-manager.nixosModules.home-manager
      inputs.nvf.nixosModules.default
      inputs.winboat.nixosModules.default
      ./configuration.nix
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.flamin = import ./home.nix;
        home-manager.extraSpecialArgs = {inherit inputs;};
        # Optionally, use home-manager.extraSpecialArgs to pass
        # arguments to home.nix
      }
      {
        imports = [inputs.aagl.nixosModules.default];
        nix.settings = inputs.aagl.nixConfig; # Set up Cachix
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
