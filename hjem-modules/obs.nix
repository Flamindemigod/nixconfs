{pkgs, ...}: {
  enable = true;
  package =
    pkgs.wrapOBS.override {
      obs-studio = pkgs.obs-studio;
    } {
      plugins = with pkgs.obs-studio-plugins; [
        obs-vkcapture
        obs-pipewire-audio-capture
      ];
    };
}
