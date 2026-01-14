{
  pkgs,
  config,
  ...
}: {
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableBashCompletion = true;
    histSize = 10000;
    histFile = "$XDG_DATA_HOME/zsh/history";
    shellInit = ''
      	bindkey ' ' magic-space

      	chpwd() {
      	  ls
      	}

      	autoload -Uz add-zsh-hook

      	function auto_nix() {
      	  # If we're already in a nix develop shell, do nothing
      	  [[ -n "$IN_NIX_SHELL" ]] && return

      	  # Walk up to find a flake
      	  local dir="$PWD"
      	  while [[ "$dir" != "/" ]]; do
      		if [[ -f "$dir/flake.nix" ]]; then
      		  nix develop
      		  return
      		fi
      		dir="${dir:h}"
      	  done
      	}

      add-zsh-hook chpwd auto_nix
    '';
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
