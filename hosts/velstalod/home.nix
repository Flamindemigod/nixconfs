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
  kitty = import ../../hjem-modules/kitty.nix;
  mpv = import ../../hjem-modules/mpv.nix {inherit pkgs;};
  obs = import ../../hjem-modules/obs.nix {inherit pkgs;};
in {
  imports = [
    ../../hjem-modules/core.nix
  ];
  hjem.users.velvy = {
    enable = true;
    directory = "/home/velvy";
    user = "velvy";
    rum.desktops.niri = lib.recursiveUpdate niri {
      config = ''
        include "dms/colors.kdl"
        include "dms/cursor.kdl"
        include "dms/layout.kdl"
        include "dms/outputs.kdl"
        include "dms/wpblur.kdl"
        include "dms/alttab.kdl"
        prefer-no-csd
        input {
        	keyboard {
        		xkb {
        			layout "us"
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
        //For Vel only
        screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

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
        }

        window-rule {
        	match app-id=".scrcpy-wrapped"
        	open-floating true
        	default-floating-position x=25 y=25 relative-to="bottom-right"
        	default-window-height { proportion 0.7; }
        	default-column-width { proportion 0.2; }
        }
        layout {
        	gaps 8
        }
      '';
    };
    rum.programs = {
      git = lib.recursiveUpdate git {
        settings.user = {
          name = "Veltearas";
          email = "veltearas@gmail.com";
          #TODO Add Signing Key
        };
      };
      kitty = kitty;
      mpv = mpv;
      obs-studio = obs;
    };
  };
}
