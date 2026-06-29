{
  nixpkgs,
  inputs,
  ...
}: let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
  spicePkgs = inputs.spicetify.legacyPackages.${pkgs.stdenv.system};
  hardware = inputs.nixos-hardware.nixosModules;
in
  nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs;};
    modules = [
      {
        networking.hostName = "hathor";
        system.stateVersion = "25.11"; #Never Change This!!
      }
      hardware.common-cpu-amd
      hardware.common-gpu-amd
      hardware.common-pc
      hardware.common-pc-ssd
      inputs.dms.nixosModules.dank-material-shell
      inputs.dms-plugins.nixosModules.default
      inputs.hjem.nixosModules.default
      {
        imports = [inputs.aagl.nixosModules.default];
        nix.settings = inputs.aagl.nixConfig;
        programs.honkers-railway-launcher.enable = true;
      }
      {
        imports = [inputs.spicetify.nixosModules.default];
        programs.spicetify = {
          enable = true;
          enabledExtensions = with spicePkgs.extensions; [
            adblockify
            hidePodcasts
            shuffle
          ];
        };
      }
      ./configuration.nix
    ];
  }
