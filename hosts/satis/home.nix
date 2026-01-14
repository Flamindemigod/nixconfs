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
in {
  imports = [
    ../../hjem-modules/core.nix
  ];
  hjem.users.flamin = {
    enable = true;
    directory = "/home/flamin";
    user = "flamin";
    rum.desktops.niri =
      {
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
          layout {
          	gaps 8
          }
        '';
      }
      // niri;
    rum.programs = {
      git = lib.recursiveUpdate git {
        settings.user = {
          name = "Flamindemigod";
          email = "flamin@flamindemigod.com";
          #TODO Add Signing Key
        };
      };
    };
  };
}
