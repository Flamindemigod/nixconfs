{pkgs, ...}: {
  imports = [
    ./zsh.nix
    ./modules/bundle-laptop.nix
  ];

  home = {
    username = "flamin";
    homeDirectory = "/home/flamin";
    stateVersion = "23.11";
  };
}
