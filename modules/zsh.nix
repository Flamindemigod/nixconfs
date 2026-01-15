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
          autoload -Uz add-zsh-hook

          function auto_ls() {
      ${pkgs.eza}/bin/eza -1 --group-directories-first --color=always --git-ignore
          }

          function auto_nix() {
          	if [[ -f flake.nix ]] && [[ -z "$IN_NIX_SHELL" ]]; then
          		nix develop
          	fi
          }

          add-zsh-hook chpwd auto_nix
          add-zsh-hook chpwd auto_ls

          alias -s md="${pkgs.bat}/bin/bat --paging=never   \
          	--style='changes,rule,numbers,snip'"
          alias -s json="${pkgs.bat}/bin/bat --paging=never \
          	--style='changes,rule,numbers,snip'"
          alias -s toml="${pkgs.bat}/bin/bat --paging=never \
          	--style='changes,rule,numbers,snip'"
          alias -s txt="${pkgs.bat}/bin/bat --paging=never \
          	--style='changes,rule,numbers,snip'"
          alias -s log="${pkgs.bat}/bin/bat --paging=never \
          	--style='changes,rule,numbers,snip'"
          alias -s mp4=${pkgs.mpv}/bin/mpv
          alias -s mkv=${pkgs.mpv}/bin/mpv

          bindkey -s '^Xgc' 'git commit -m ""\C-b'
    '';
    shellAliases = let
      flakeDir = "~/.nix";
    in {
      ls = "${pkgs.eza}/bin/eza -1 --group-directories-first --color=always --git-ignore";
      ll = ''ls -l --time-style="+%Y-%m-%d %H:%M"'';
      v = "$EDITOR";
      se = "sudoedit";
      cat = ''        ${pkgs.bat}/bin/bat --paging=never	\
        				--style="changes,rule,numbers,snip"'';
      ff = "${pkgs.fastfetch}/bin/fastfetch";
      du = "${pkgs.dust}/bin/dust";
      rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
      upd = "sudo nix flake update --flake ${flakeDir}";
      upg = "sudo nixos-rebuild --upgrade switch --flake ${flakeDir}";
      gd = ''${pkgs.git}/bin/git diff --output-indicator-new=" " --output-indicator-old=" "'';
      gl = "${pkgs.git}/bin/git log --stat --graph --all --pretty=format:'%C(magenta)%h %C(white) \
				%an %ar%C(auto)  %D%n%s%n'";
    };
    ohMyZsh = {
      enable = true;
      plugins = ["git" "sudo"];
      theme = "agnoster";
    };
  };
}
