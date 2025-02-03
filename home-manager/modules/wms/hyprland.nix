{pkgs, ...}: {
    wayland.windowManager.hyprland.enable = true;
    wayland.windowManager.hyprland.xwayland.enable = true;
    wayland.windowManager.hyprland.systemd.variables = ["--all"];
    wayland.windowManager.hyprland.settings = {
      # name: Rosé Pine
      # author: jishnurajendran
      # upstream: https://github.com/jishnurajendran/hyprland-rosepine/blob/main/rose-pine.conf
      # All natural pine, faux fur and a bit of soho vibes for the classy minimalist
      "$base           " = " 0xff191724";
      "$surface        " = " 0xff1f1d2e";
      "$overlay        " = " 0xff26233a";
      "$muted          " = " 0xff6e6a86";
      "$subtle         " = " 0xff908caa";
      "$text           " = " 0xffe0def4";
      "$love           " = " 0xffeb6f92";
      "$gold           " = " 0xfff6c177";
      "$rose           " = " 0xffebbcba";
      "$pine           " = " 0xff31748f";
      "$foam           " = " 0xff9ccfd8";
      "$iris           " = " 0xffc4a7e7";
      "$highlightLow   " = " 0xff21202e";
      "$highlightMed   " = " 0xff403d52";
      "$highlightHigh  " = " 0xff524f67      ";

      "$mainMod" = "SUPER";

      monitor = [
        "HDMI-A-1, highres,0x0,1"
        "desc:Hewlett Packard LA1905 CNC019039F,highres, -900x-200, 1, transform,3"
        "desc:Hewlett Packard LA1905 CNC10108WV,highres,1920x0,1"
      ];
      workspace = [
        "1,default:true,monitor:desc:Hewlett Packard LA1905 CNC019039F"
        "2,default:true,monitor:desc:Hewlett Packard LA1905 CNC019039F"
        "3,default:true,monitor:desc:Hewlett Packard LA1905 CNC019039F"
        "4,default:true,monitor:HDMI-A-1"
        "5,default:true,monitor:HDMI-A-1"
        "6,default:true,monitor:HDMI-A-1"
        "7,default:true,monitor:desc:Hewlett Packard LA1905 CNC10108WV"
        "8,default:true,monitor:desc:Hewlett Packard LA1905 CNC10108WV"
        "9,default:true,monitor:desc:Hewlett Packard LA1905 CNC10108WV"
      ];

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,~/screens"
        "GTK_THEME,adw-gtk3-dark"
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
        sensitivity = -1; # -1.0 - 1.0, 0 means no modification.
      };
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "$rose $pine $love $iris 90deg";
        "col.inactive_border" = "$muted";

        #layout = "dwindle";

        #no_cursor_warps = false;
      };

      decoration = {
        rounding = 10;

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
        workspace_swipe = false;
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
        "${pkgs.ckb-next}/bin/ckb-next -b"
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
