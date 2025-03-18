{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    extraPackages = [pkgs.rust-analyzer];
  };
  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix/home-manager/modules/nvim";
  };
}
