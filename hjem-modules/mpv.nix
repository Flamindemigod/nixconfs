{pkgs, ...}: {
  enable = true;
  config = {
    autofit-larger = "100%x100%";
    hwdec = true;
    keep-open="yes";
    save-position-on-quit="yes";
  };
  profiles={
    dont-save-on-quit = {
      profile-cond="eof_reached";
      save-position-on-quit="no";
    };
  };
}
