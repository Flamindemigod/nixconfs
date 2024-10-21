{
  programs.wofi = {
    enable = true;
    settings = {
      width = 900;
      height = 500;
      location = "center";
      show = "drun";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 40;
      gtk_dark = true;
    };
    style = ''
      *{
      all: unset;
      }
      window {
          margin: 0px;
          border-radius: 15px;
          color: #e0def4;
          font-family: 'Fira Code Nerd Font';
          font-size: 16px;
          background: transparent;
          border: none;
      }


      #input {
        all: unset;
        min-height: 36px;
        padding: 4px 10px;
        margin: 4px;
        border: none;
        font-weight: bold;
        outline: none;
        border-radius: 15px;
        margin: 10px;
        margin-bottom: 2px;
        color: #eb6f92;
        background-color: #1f1d2e;

      }

      #inner-box {
        margin: 4px;
        padding: 10px;
        font-weight: bold;
        border-radius: 15px;
        background-color: #26233a;
        color: #191724;
      }

      #outer-box {
        margin: 0px;
        padding: 3px;
        border-radius: 15px;
        background-color: #26233a;
      }

      #scroll {
        margin-top: 5px;
        border: none;
        border-radius: 15px;
        margin-bottom: 5px;
      }

      #text {
          margin: 5px;
          border: none;
          color: #e0def4;
      }

      #text:selected {
        color: #191724;
        margin: 0px 0px;
        border: none;
        border-radius: 15px;
      }

      #entry {
        padding: 2px;
        margin: 0px 0px;
        border: none;
        border-radius: 15px;
        background-color: transparent;
      }

      #entry:selected {
        margin: 0px 0px;
        border: none;
        border-radius: 15px;
        background: linear-gradient(90deg, #eb6f92 0%, #9BBEF4 100%);
          color: #191724;
          outline: none;
      }

      #entry:selected * {
          background-color: transparent;
          color: #191724;
          border-radius: 0px;
          outline: none;
      }

    '';
  };
}
