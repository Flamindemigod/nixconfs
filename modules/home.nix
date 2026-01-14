{
  inputs,
  pkgs,
  ...
}: {
  hjem = {
    extraModules = [
      inputs.hjem-rum.hjemModules.default
    ];
    users.flamin = {
      enable = true;
      directory = "/home/flamin";
      user = "flamin";
      rum.desktops.niri = {
        enable = true;
        package = null;
        spawn-at-startup = [
          ["dms" "run"]
        ];
        config = ''
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
               		warp-mouse-to-focus
               		focus-follows-mouse
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
        '';
        binds = {
          "MOD+SHIFT+SLASH" = {
            action = "show-hotkey-overlay";
          };
          "MOD+C" = {
            action = "close-window";
            parameters.repeat = false;
          };
          "MOD+Q" = {
            parameters.hotkey-overlay-title = "Opens Kitty Terminal";
            spawn = ["${pkgs.kitty}/bin/kitty"];
          };
          "MOD+R" = {
            parameters.hotkey-overlay-title = "Opens Spotlight Search";
            parameters.repeat = false;
            spawn = ["dms" "ipc" "call" "spotlight" "toggle"];
          };
          "MOD+SHIFT+L" = {
            parameters.hotkey-overlay-title = "Locks The Screen";
            spawn = ["dms" "ipc" "call" "lock" "lock"];
          };
          "MOD+SHIFT+P" = {
            parameters.hotkey-overlay-title = "Turns Monitors Off";
            action = "power-off-monitors";
          };
          "MOD+SHIFT+C" = {
            action = "screenshot";
          };
          "MOD+V" = {
            action = "toggle-window-floating";
          };
          "MOD+F" = {
            action = "maximize-column";
          };
          "MOD+SHIFT+F" = {
            action = "fullscreen-window";
          };
          "MOD+SHIFT+1" = {action = "move-window-to-workspace 1";};
          "MOD+SHIFT+2" = {action = "move-window-to-workspace 2";};
          "MOD+SHIFT+3" = {action = "move-window-to-workspace 3";};
          "MOD+SHIFT+4" = {action = "move-window-to-workspace 4";};
          "MOD+SHIFT+5" = {action = "move-window-to-workspace 5";};
          "MOD+SHIFT+6" = {action = "move-window-to-workspace 6";};
          "MOD+SHIFT+7" = {action = "move-window-to-workspace 7";};
          "MOD+SHIFT+8" = {action = "move-window-to-workspace 8";};
          "MOD+SHIFT+9" = {action = "move-window-to-workspace 9";};
          "XF86AudioRaiseVolume" = {
            parameters.allow-when-locked = true;
            spawn = ["/usr/bin/env" "sh" "-c" "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+" "-l" "1.0"];
          };
          "XF86AudioLowerVolume" = {
            parameters.allow-when-locked = true;
            spawn = ["/usr/bin/env" "sh" "-c" "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"];
          };
          "XF86AudioMute" = {
            parameters.allow-when-locked = true;
            spawn = ["/usr/bin/env" "sh" "-c" "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
          };
          "XF86AudioMicMute" = {
            parameters.allow-when-locked = true;
            spawn = ["/usr/bin/env" "sh" "-c" "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"];
          };
          "XF86AudioPlay" = {
            parameters.allow-when-locked = true;
            spawn = ["/usr/bin/env" "sh" "-c" "playerctl" "play-pause"];
          };
          "XF86AudioStop" = {
            parameters.allow-when-locked = true;
            spawn = ["/usr/bin/env" "sh" "-c" "playerctl" "stop"];
          };
          "XF86AudioPrev" = {
            parameters.allow-when-locked = true;
            spawn = ["/usr/bin/env" "sh" "-c" "playerctl" "previous"];
          };
          "XF86AudioNext" = {
            parameters.allow-when-locked = true;
            spawn = ["/usr/bin/env" "sh" "-c" "playerctl" "next"];
          };
          "MOD+O" = {
            parameters.repeat = false;
            action = "close-window";
          };
          "MOD+LEFT" = {action = "focus-column-left";};
          "MOD+DOWN" = {action = "focus-window-down";};
          "MOD+UP" = {action = "focus-window-up";};
          "MOD+RIGHT" = {action = "focus-column-right";};
          "MOD+SHIFT+LEFT" = {action = "move-column-left";};
          "MOD+SHIFT+DOWN" = {action = "move-window-down";};
          "MOD+SHIFT+UP" = {action = "move-window-up";};
          "MOD+SHIFT+RIGHT" = {action = "move-column-right";};
          "Mod+WheelScrollDown" = {
            parameters.cooldown-ms = 150;
            action = "focus-workspace-down";
          };
          "Mod+WheelScrollUp" = {
            parameters.cooldown-ms = 150;
            action = "focus-workspace-up";
          };
          "Mod+BracketLeft" = {action = "consume-or-expel-window-left";};
          "Mod+BracketRight" = {action = "consume-or-expel-window-right";};
        };
      };
    };
    clobberByDefault = true;
  };
}
