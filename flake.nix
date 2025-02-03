{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:nixos/nixpkgs/585f76290ed66a3fdc5aae0933b73f9fd3dca7e3"; 
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs"; # Name of nixpkgs input you want to use
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
   hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    aagl,
    ...
  } @ inputs: let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    # nixos - system hostname
    nixosConfigurations.weneg = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };
      modules = [
        ./nixos/configuration.nix
        {
          imports = [aagl.nixosModules.default];
          nix.settings = aagl.nixConfig; # Set up Cachix
          programs.anime-game-launcher.enable = false; # Adds launcher and /etc/hosts rules
          programs.honkers-railway-launcher.enable = true;
          programs.honkers-launcher.enable = true;
          programs.sleepy-launcher.enable = true;
        }
      ];
    };

    homeConfigurations.flamin = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgs;
      modules = [./home-manager/home.nix
        ];
    };
  };
}
