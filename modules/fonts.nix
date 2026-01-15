{pkgs, ...}: {
  fonts.fontDir.enable = true;
  fonts.enableDefaultPackages = true;
  fonts.fontconfig = {
    defaultFonts = {
      serif = ["Liberation Serif"];
      sansSerif = ["Liberation"];
      monospace = ["FiraCode"];
    };
  };

  fonts.packages = with pkgs; [
    liberation_ttf
    fira-code
    jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.symbols-only
  ];
}
