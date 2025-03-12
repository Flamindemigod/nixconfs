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
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    ags.url = "github:aylur/ags";
    stylix.url = "github:danth/stylix";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    aagl,
    spicetify-nix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
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
        inputs.stylix.nixosModules.stylix
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
    #LAPTOP
    nixosConfigurations.hecate = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };
      modules = [
        ./nixos/configuration-laptop.nix
        inputs.stylix.nixosModules.stylix
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
    };

    homeConfigurations."flamin@hecate" = home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = {inherit inputs;};
      pkgs = pkgs;
      modules = [
        ./home-manager/home-laptop.nix
        inputs.stylix.homeManagerModules.stylix
        inputs.ags.homeManagerModules.default
      ];
    };
    homeConfigurations."flamin@weneg" = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgs;

      modules = [
        ./home-manager/home.nix
      ];
    };
  };
}
