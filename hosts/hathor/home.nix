{
  inputs,
  pkgs,
  lib,
  options,
  config,
  ...
}: let
  niri = import ../../hjem-modules/niri.nix {inherit pkgs lib options config;};
  git = import ../../hjem-modules/git.nix {inherit pkgs;};
  keepassxc = import ../../hjem-modules/keepassxc.nix;
  kitty = import ../../hjem-modules/kitty.nix;
  mpv = import ../../hjem-modules/mpv.nix {inherit pkgs;};
  obs = import ../../hjem-modules/obs.nix {inherit pkgs;};
  yazi = import ../../hjem-modules/yazi.nix;
  vim = import ../../hjem-modules/vim.nix;
in {
  imports = [
    ../../hjem-modules/core.nix
  ];
  hjem.users.flamin = {
    enable = true;
    directory = "/home/flamin";
    user = "flamin";
    files = {} // vim;
    rum.desktops.niri = lib.recursiveUpdate niri {
      config = ''
               //include "dms/colors.kdl"
               //include "dms/cursor.kdl"
               //include "dms/layout.kdl"
               //include "dms/outputs.kdl"
               //include "dms/wpblur.kdl"
               //include "dms/alttab.kdl"
               prefer-no-csd
               input {
                 keyboard {
                   xkb {
                     layout "gb"
                     options "caps:swapescape"
                   }
                   numlock
                 }
                 touchpad {
                   tap
                   natural-scroll
                   scroll-method "two-finger"
                 }
                 focus-follows-mouse max-scroll-amount="0%"
                 warp-mouse-to-focus
               }
               hotkey-overlay {
                 skip-at-startup
               }
               window-rule {
                 match app-id=r#"^org\.keepassxcc\.KeePassXC$"#
                 block-out-from "screen-capture"
               }

               window-rule {
                 geometry-corner-radius 12
                 clip-to-geometry true
               }
               window-rule {
                 match app-id="steam" title=r#"^notificationtoasts_\d+_desktop$"#
                 default-floating-position x=10 y=10 relative-to="bottom-right"
                 open-focused false
               }
               window-rule {
                 match app-id=".scrcpy-wrapped"
                 open-floating true
                 default-floating-position x=25 y=25 relative-to="bottom-right"
                 min-width 200
                 min-height 200
                 default-window-height { proportion 0.3; }
                 default-column-width { proportion 0.4; }
               }
        window-rule {
        	match app-id="steam_app_306130" title="Elder Scrolls Online"
        	open-fullscreen false
                open-maximized true
        }
        window-rule {
          match title="Picture-in-picture"
          open-floating true
          default-floating-position x=25 y=25 relative-to="bottom-right"
                 min-width 200
                 min-height 200
          default-window-height { fixed 378; }
          default-column-width { fixed 672; }
        }
        layout {
                 gaps 8
               }
      '';
    };
    rum.programs = {
      git = lib.recursiveUpdate git {
        settings.user = {
          name = "Flamindemigod";
          email = "flamin@flamindemigod.com";
          #TODO Add Signing Key
        };
      };
      keepassxc = keepassxc;
      kitty = kitty;
      mpv = mpv;
      obs-studio = obs;
      yazi = yazi;
    };
  };
}
