{
  inputs,
  pkgs,
  lib,
  options,
  config,
  ...
}: let
  git = import ../../hjem-modules/git.nix {inherit pkgs;};
  yazi = import ../../hjem-modules/yazi.nix;
  vim = import ../../hjem-modules/vim.nix;
in {
  imports = [
    ../../hjem-modules/core.nix
  ];
  hjem.users.flamin = {
    enable = true;
    directory = "/home/flamin";
    user = "flamin";
    files = {} // vim;
    rum.programs = {
      git = lib.recursiveUpdate git {
        settings.user = {
          name = "Flamindemigod";
          email = "flamin@flamindemigod.com";
          #TODO Add Signing Key
        };
      };
      yazi = yazi;
    };
  };
}
