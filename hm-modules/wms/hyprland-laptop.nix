{pkgs, ...}: {
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.xwayland.enable = true;
  wayland.windowManager.hyprland.systemd.variables = ["--all"];
  wayland.windowManager.hyprland.settings = {
    # name: Rosé Pine
    # author: jishnurajendran
    # upstream: https://github.com/jishnurajendran/hyprland-rosepine/blob/main/rose-pine.conf
    # All natural pine, faux fur and a bit of soho vibes for the classy minimalist

    "$mainMod" = "SUPER";

    monitor = [
      "eDP-1,preferred, auto, auto"
    ];
    xwayland = {
      force_zero_scaling = true;
    };
    workspace = [
      "1,default:true,monitor:eDP-1"
      "2,default:true,monitor:eDP-1"
      "3,default:true,monitor:eDP-1"
    ];

    env = [
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"
      "XCURSOR_SIZE,16"
      "QT_QPA_PLATFORM,wayland"
      "XDG_SCREENSHOTS_DIR,~/screens"
    ];

    debug = {
      disable_logs = false;
      enable_stdout_logs = true;
    };

    input = {
      kb_layout = "gb";
      follow_mouse = 1;
      numlock_by_default = true;
      touchpad = {
        natural_scroll = false;
      };
      sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
    };
    general = {
      gaps_in = 2;
      gaps_out = 5;
      border_size = 1;

      #layout = "dwindle";

      #no_cursor_warps = false;
    };

    decoration = {
      rounding = 5;

      blur = {
        enabled = true;
        size = 24;
        passes = 3;
        new_optimizations = true;
      };
      active_opacity = 0.9;
      inactive_opacity = 0.7;
    };

    animations = {
      enabled = true;

      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      #bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";

      animation = [
        "windows,     1, 7,  myBezier"
        "windowsOut,  1, 7,  default, popin 80%"
        "border,      1, 10, default"
        "borderangle, 1, 8,  default"
        "fade,        1, 7,  default"
        "workspaces,  1, 6,  default"
      ];
    };

    dwindle = {
      pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true; # you probably want this
    };

    master = {
      new_status = "master";
    };

    gestures = {
      workspace_swipe = true;
    };

    misc = {
      animate_manual_resizes = false;
      animate_mouse_windowdragging = false;
      enable_swallow = true;
      render_ahead_of_time = false;
      disable_hyprland_logo = true;
    };

    windowrule = [
      "float, ^(imv)$"
      "float, ^(mpv)$"
      "float, class:^(wofi)$"
    ];

    layerrule = [
      "noanim, astal_statusline"
      "noanim, astal_menu_mode"
      "noanim, astal_file_explorer"
    ];
    windowrulev2 = [
      "float, title:^(Sprinator)$"
      "size 100% 95%, title:^(Sprinator)$"
      "center, title:^(Sprinator)$"
      "noinitialfocus, title:^(Sprinator)$"
      "nofocus 1, title:^(Sprinator)$"
      "xray 1, title:^(Sprinator)$"
      "opacity 1.0 override 1.0 override, title:^(Sprinator)$"
      "allowsinput 0, title:^(Sprinator)$"
      "noborder 1, title:^(Sprinator)$"
      "noshadow 1, title:^(Sprinator)$"
      "noblur 1, title:^(Sprinator)$"
    ];

    exec-once = [
      "${pkgs.waybar}/bin/waybar"
      "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store"
      "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store"
      "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1"
    ];

    bind = [
      "$mainMod SHIFT, V, exec, ${pkgs.cliphist}/bin/cliphist list | ${pkgs.wofi}/bin/wofi --dmenu | ${pkgs.cliphist}/bin/cliphist decode | ${pkgs.wl-clipboard}/bin/wl-copy"

      "$mainMod, Q, exec, ${pkgs.kitty}/bin/kitty"
      "$mainMod, C, killactive,"
      "$mainMod, M, exit,"
      "$mainMod, E, exec, ${pkgs.dolphin}/bin/dolphin"
      "$mainMod, V, togglefloating,"
      "$mainMod, F, fullscreen,"
      "$mainMod, R, exec, ${pkgs.wofi}/bin/wofi --show drun"
      "$mainMod, P, pseudo, # dwindle"
      "$mainMod, J, togglesplit, # dwindle"
      "$mainMod SHIFT, C, exec, ${pkgs.grimblast}/bin/grimblast copy area"
      "$mainMod ALT, C, exec, ${pkgs.hyprpicker}/bin/hyprpicker -f hex -a -r"

      #application keybinds
      "$mainMod SHIFT, F, exec, ${pkgs.firefox-devedition}/bin/firefox-devedition"
      "$mainMod SHIFT, S, exec, steam"

      # Move focus with mainMod + arrow keys
      "$mainMod, left,  movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up,    movefocus, u"
      "$mainMod, down,  movefocus, d"

      # Moving windows
      "$mainMod SHIFT, left,  swapwindow, l"
      "$mainMod SHIFT, right, swapwindow, r"
      "$mainMod SHIFT, up,    swapwindow, u"
      "$mainMod SHIFT, down,  swapwindow, d"

      # Window resizing                     X  Y
      "$mainMod CTRL, left,  resizeactive, -60 0"
      "$mainMod CTRL, right, resizeactive,  60 0"
      "$mainMod CTRL, up,    resizeactive,  0 -60"
      "$mainMod CTRL, down,  resizeactive,  0  60"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
      "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
      "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
      "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
      "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
      "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
      "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
      "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
      "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
      "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      # Volume and Media Control
      ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
      ", XF86AudioLowerVolume, exec, pamixer -d 5 "
      ", XF86AudioMute, exec, pamixer -t"
      ", XF86AudioMicMute, exec, pamixer --default-source -m"

      # Brightness control
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
      ", XF86MonBrightnessUp, exec, brightnessctl set +5% "

      # Configuration files
      ''$mainMod SHIFT, N, exec, kitty -e sh -c "rb"''
      ''$mainMod SHIFT, C, exec, kitty -e sh -c "conf"''
      ''$mainMod SHIFT, H, exec, kitty -e sh -c "nvim ~/nix/home-manager/modules/wms/hyprland.nix"''
      ''$mainMod SHIFT, W, exec, kitty -e sh -c "nvim ~/nix/home-manager/modules/wms/waybar.nix''

      # Waybar
      "$mainMod, B, exec, pkill -SIGUSR1 waybar"
      "$mainMod, W, exec, pkill -SIGUSR2 waybar"

      # Disable all effects
      "$mainMod Shift, G, exec, ~/.config/hypr/gamemode.sh "
    ];

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
