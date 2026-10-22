{
  nixpkgs,
  inputs,
  ...
}: let
  #pkgs = nixpkgs.legacyPackages.x86_64-linux;
  hardware = inputs.nixos-hardware.nixosModules;
in
  nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs;};
    modules = [
      {
        networking.hostName = "bes";
        system.stateVersion = "24.11"; #Never Change This!!
      }
      hardware.common-cpu-amd
      hardware.common-gpu-amd
      hardware.common-pc
      hardware.common-pc-ssd
      inputs.hjem.nixosModules.default
      ./configuration.nix
    ];
  }
