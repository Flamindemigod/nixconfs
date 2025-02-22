{pkgs, ...}: let
  main37Sophia = ../../../resources/37-sophia-by-kurohush.jpg;
  #alt37Sophia = ../../../resources/37-sophia-shule-de-yu.jpg;
  alt37Sophia = ../../../resources/37-sophia-by-gjygyao.jpg;
  main37 = ../../../resources/37-by-chejamong.jpg;
  furinaCenter = pkgs.fetchurl {
    url = "https://github.com/Flamindemigod/dots/blob/6b32e6264b04de93a0f1afd1946fe30fac9f1058/hypr/Wallpapers/FurinaWallpaper.png?raw=true";
    sha256 = "sha256-zBkM83YeRe+QyHHchV4sa+Vl+VaKBVUJT1sDE3eSgmE=";
  };
  velLeft = pkgs.fetchurl {
    url = "https://github.com/Flamindemigod/dots/blob/2b8a615ad8dc7537ac332d21ac421f764f62ca5b/hypr/Wallpapers/CharaStudio-2023-02-11-06-49-37-Render.png?raw=true";
    sha256 = "sha256-4QQ+DJ6VV2l/ysA+iwr6pqclzvslrqurhtq2l6cBCBk=";
  };
  sparkleLeft = pkgs.fetchurl {
    url = "https://cdn.donmai.us/original/bf/cf/__sparkle_honkai_and_1_more_drawn_by_ringeko_chan__bfcf4f0e416f7e56afd8205b0d90c7bf.jpg";
    sha256 = "sha256-aBn/Js6quW1SSCSQYvcZbfMCeEMIF558u+xIbu+m9yA=";
  };
  yelanRight = pkgs.fetchurl {
    url = "https://github.com/Flamindemigod/dots/blob/2b8a615ad8dc7537ac332d21ac421f764f62ca5b/hypr/Wallpapers/__yelan_genshin_impact_drawn_by_jiangyiting17__8d0635cda22788d057980600ec3a2e67.jpg?raw=true";
    sha256 = "sha256-36IbLVPKBuTtsJVow1p+E08roGYfLWAPypESCrrzuSw=";
  };
  velRight = pkgs.fetchurl {
    url = "https://github.com/Flamindemigod/dots/blob/2b8a615ad8dc7537ac332d21ac421f764f62ca5b/hypr/Wallpapers/CharaStudio-2023-02-11-05-58-17-Render.png?raw=true";
    sha256 = "sha256-JTUqJKzM6hifC04KLuCY+D2Cq0WQng/CVWLkJDtHmCg=";
  };
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [
        "${main37Sophia}"
        #"${furinaCenter}"
        # "${sparkleLeft}"
        # "${yelanRight}"
        #"${velLeft}"
        #"${velRight}"
      ];
      wallpaper = [
        "eDP-1, ${main37Sophia}"
        # "desc:Hewlett Packard LA1905 CNC019039F, contain:${sparkleLeft}"
        # "desc:Hewlett Packard LA1905 CNC10108WV, ${yelanRight}"
        #"desc:Hewlett Packard LA1905 CNC019039F, ${velLeft}"
        #"desc:Hewlett Packard LA1905 CNC10108WV, ${velRight}"
      ];
    };
  };
}
