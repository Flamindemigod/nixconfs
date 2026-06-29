{
  description = "Flamin & Vel's System Configs";
  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    niri.url = "github:sodiboo/niri-flake";
    dms.url = "github:AvengeMedia/DankMaterialShell/stable";
    dms-plugins.url = "github:AvengeMedia/dms-plugin-registry";
    hjem-rum = {
      url = "github:snugnug/hjem-rum";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem.follows = "hjem-rum/hjem";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    spicetify.url = "github:Gerg-L/spicetify-nix";
    sops-nix.url = "github:Mic92/sops-nix";
    nvf = {
      url = "github:NotAShelf/nvf";
    };
    simple-nixos-mailserver = {
      url = "gitlab:simple-nixos-mailserver/nixos-mailserver/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixarr.url = "github:nix-media-server/nixarr";
  };
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    allHosts = builtins.listToAttrs (map (file: let
      name = builtins.baseNameOf file;
    in {
      name = name;
      value = import (./hosts + "/${name}") {inherit nixpkgs inputs;};
    }) (builtins.attrNames (builtins.readDir ./hosts)));
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations = allHosts;
  };
}
