{
  nixpkgs,
  inputs,
  ...
}:
nixpkgs.lib.nixosSystem {
  specialArgs = {inherit inputs;};
  system = "x86_64-linux";
  modules = [
    {
      networking.hostName = "satis";
      system.stateVersion = "25.11"; #Never Change This!!
    }
    inputs.niri.nixosModules.niri
    inputs.dms.nixosModules.dank-material-shell
    inputs.dms-plugins.modules.default
    inputs.hjem.nixosModules.default
    ./configuration.nix
  ];
}
