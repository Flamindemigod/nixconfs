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
    system = "x86_64-linux";
    modules = [
      {
        networking.hostName = "satis";
        system.stateVersion = "25.11"; #Never Change This!!
        hardware.nvidia.open = true;
        hardware.nvidia.prime = {
          intelBusId = "PCI:2@0:0:0";
          nvidiaBusId = "PCI:0@1:0:0";
        };
      }
      hardware.common-cpu-intel
      hardware.common-gpu-nvidia
      hardware.common-pc-laptop
      hardware.common-pc-laptop-ssd
      inputs.niri.nixosModules.niri
      inputs.dms.nixosModules.dank-material-shell
      inputs.dms-plugins.modules.default
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
