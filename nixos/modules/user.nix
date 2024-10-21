{ pkgs, ... }:
{
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.flamin = {
      isNormalUser = true;
      description = "Flamin";
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
      ];
      packages = with pkgs; [ ];
    };
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "flamin";
}
