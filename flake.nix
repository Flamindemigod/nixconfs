{
  description = "Personal System Configurations";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
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
    stylix.url = "github:danth/stylix";
  };
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    # Import all host configurations from the `hosts` directory
    allHosts = builtins.listToAttrs (map (name: {
      name = name;
      value = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/${name}/configuration.nix # Load the actual host config file
          ({...}: {_module.args.inputs = inputs;}) # Pass inputs to all modules
        ];
      };
    }) (builtins.attrNames (builtins.readDir ./hosts)));
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations = allHosts;
  };
}
