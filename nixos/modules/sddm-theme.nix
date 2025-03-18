{pkgs}: let
  bgImage = "https://github.com/Flamindemigod/dots/blob/2b8a615ad8dc7537ac332d21ac421f764f62ca5b/sddm/chili/assets/background.jpg?raw=true";
  image = pkgs.fetchurl {
    url = bgImage;
    sha256 = "1kni7l9bdw7ss63jkmy4r3xp4g0gqqmr05bk5sbrrwxmlibxzvwk";
  };
in
  pkgs.stdenv.mkDerivation {
    name = "sddm-theme";
    src = pkgs.fetchFromGitHub {
      owner = "MarianArlt";
      repo = "sddm-chili";
      rev = "6516d50176c3b34df29003726ef9708813d06271";
      sha256 = "sha256-wxWsdRGC59YzDcSopDRzxg8TfjjmA3LHrdWjepTuzgw=";
    };
    installPhase = ''
      mkdir -p $out
      cp -R ./* $out/
      cd $out/
      rm assets/background.jpg
      cp -r ${image} $out/assets/background.jpg
    '';
  }
