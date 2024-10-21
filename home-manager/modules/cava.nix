{
  programs.cava = {
    enable = true;
    settings = {
      general.autosens = 1;
      general.sensitivity = 120;
      general.bars = 0;
      general.bar_width = 0.5;
      general.bar_spacing = 0.2;
      output.method = "ncurses";
      output.channels = "stereo";
      color.background = "'#191724'";
      color.gradient = 1;
      color.gradient_count = 8;
      color.gradient_color_1 = "'#31748f'";
      color.gradient_color_2 = "'#9ccfd8'";
      color.gradient_color_3 = "'#c4a7e7'";
      color.gradient_color_4 = "'#ebbcba'";
      color.gradient_color_5 = "'#f6c177'";
      color.gradient_color_6 = "'#eb6f92'";
      smoothing.monstercat = 1;
      smoothing.integral = 1;
    };
  };
}
