{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../hm-modules
    inputs.matugen.nixosModules.default
  ];
  home = {
    username = "flamin";
    homeDirectory = "/home/flamin";
    stateVersion = "23.11";
  };
  programs.home-manager.enable = true;
}
