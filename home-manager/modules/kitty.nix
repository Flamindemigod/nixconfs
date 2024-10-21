{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 16.0;
      package = pkgs.fira-code;
    };
    settings = {
      enable_audio_bell = "no";
    };
    keybindings = {
      "kitty_mod+plus" = "change_font_size all +2.0";
      "kitty_mod+minus" = "change_font_size all -2.0";
    };
    themeFile = "rose-pine";
  };
}
