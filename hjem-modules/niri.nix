{
  lib,
  pkgs,
  config,
  ...
}: {
  spawn-at-startup =
    [
    ]
    ++ [(lib.mkIf config.programs.dank-material-shell.enable ["dms" "run"])];
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
    "XF86AUDIORAISEVOLUME" = {
      parameters.allow-when-locked = true;
      spawn = ["/usr/bin/env" "sh" "-c" "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+" "-l" "1.0"];
    };
    "XF86AUDIOLOWERVOLUME" = {
      parameters.allow-when-locked = true;
      spawn = ["/usr/bin/env" "sh" "-c" "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"];
    };
    "XF86AUDIOMUTE" = {
      parameters.allow-when-locked = true;
      spawn = ["/usr/bin/env" "sh" "-c" "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
    };
    "XF86AUDIOMICMUTE" = {
      parameters.allow-when-locked = true;
      spawn = ["/usr/bin/env" "sh" "-c" "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"];
    };
    "XF86AUDIOPLAY" = {
      parameters.allow-when-locked = true;
      spawn = ["/usr/bin/env" "sh" "-c" "playerctl" "play-pause"];
    };
    "XF86AUDIOSTOP" = {
      parameters.allow-when-locked = true;
      spawn = ["/usr/bin/env" "sh" "-c" "playerctl" "stop"];
    };
    "XF86AUDIOPREV" = {
      parameters.allow-when-locked = true;
      spawn = ["/usr/bin/env" "sh" "-c" "playerctl" "previous"];
    };
    "XF86AUDIONEXT" = {
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
    "MOD+WHEELSCROLLDOWN" = {
      parameters.cooldown-ms = 150;
      action = "focus-workspace-down";
    };
    "MOD+WHEELSCROLLUP" = {
      parameters.cooldown-ms = 150;
      action = "focus-workspace-up";
    };
    "MOD+SHIFT+BRACKETLEFT" = {action = "consume-or-expel-window-left";};
    "MOD+SHIFT+BRACKETRIGHT" = {action = "consume-or-expel-window-right";};
  };
}
