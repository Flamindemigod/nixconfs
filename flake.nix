{
  inputs = {
    # This is pointing to an unstable release.
    # If you prefer a stable release instead, you can this to the latest number shown here: https://nixos.org/download
    # i.e. nixos-24.11
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    	nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	  	niri.url = "github:sodiboo/niri-flake";
		dms.url = "github:AvengeMedia/DankMaterialShell/stable";
		dms-plugins.url = "github:AvengeMedia/dms-plugin-registry";
	};
  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.satis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
	  modules = [ 
			./configuration.nix
			inputs.niri.nixosModules.niri
			inputs.dms.nixosModules.dank-material-shell
			inputs.dms-plugins.modules.default
		 ];
	  specialArgs = { inherit inputs; };
    };
  };
}

