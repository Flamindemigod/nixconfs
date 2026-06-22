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
        networking.hostName = "diana";
        system.stateVersion = "24.11"; #Never Change This!!
      }
      hardware.common-cpu-intel
      hardware.common-pc
      hardware.common-pc-ssd
      inputs.hjem.nixosModules.default
      ./configuration.nix
    ];
  }
