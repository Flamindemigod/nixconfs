{
  description = "Personal System Configurations";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

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
    matugen = {
      url = "github:/InioX/Matugen";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
  };
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    # Import all host configurations from the `hosts` directory
    allHosts = builtins.listToAttrs (map (
      file: let
        name = builtins.baseNameOf file;
      in {
        name = name;
        value = import (./hosts + "/${name}") {inherit nixpkgs inputs;};
      }
    ) (builtins.attrNames (builtins.readDir ./hosts)));
  in {
    config.nix.channel.enable = false;
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations = allHosts;
  };
}
