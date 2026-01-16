{
  nixpkgs,
  inputs,
  ...
}: let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
  spicePkgs = inputs.spicetify.legacyPackages.${pkgs.stdenv.system};
in
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
