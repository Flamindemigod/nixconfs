{pkgs, ...}: {
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = let
      flakeDir = "~/.nix";
    in {
      ll = "ls -lh";
      v = "$EDITOR";
      se = "sudoedit";
      ff = "${pkgs.fastfetch}/bin/fastfetch";
      du = "${pkgs.dust}/bin/dust";
      rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
      upd = "sudo nix flake update --flake ${flakeDir}";
      upg = "sudo nixos-rebuild --upgrade switch --flake ${flakeDir}";
    };
    ohMyZsh = {
      enable = true;
      plugins = ["git" "sudo"];
      theme = "agnoster";
    };
  };
}
