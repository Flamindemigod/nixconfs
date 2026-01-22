{
  nixpkgs,
  inputs,
  ...
}: let
  hardware = inputs.nixos-hardware.nixosModules;
in
  nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs;};
    system = "x86_64-linux";
    modules = [
      {
        networking.hostName = "velstalod";
        system.stateVersion = "25.11"; #Never Change This!!
      }
      hardware.common-cpu-intel-cpu-only
      hardware.common-gpu-amd
      hardware.common-pc-laptop
      inputs.niri.nixosModules.niri
      inputs.dms.nixosModules.dank-material-shell
      inputs.dms-plugins.modules.default
      inputs.hjem.nixosModules.default
      ./configuration.nix
    ];
  }
