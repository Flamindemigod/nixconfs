{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = "no";
    };
    keybindings = {
      "kitty_mod+plus" = "change_font_size all +2.0";
      "kitty_mod+minus" = "change_font_size all -2.0";
    };
  };
}
