{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 25;
        spacing = 2;
        margin-bottom = -5;

        modules-left = ["hyprland/workspaces"];
        modules-center = ["custom/waybar-mpris"];
        modules-right = [
          "network"
          "cpu"
          "wireplumber"
          "keyboard-state"
          "battery"
          "clock"
          "tray"
          #"custom/power_menu"
        ];

        "custom/waybar-mpris" = {
          "return-type" = "json";
          exec = "waybar-mpris --autofocus --pause \"󰏤 \"";
          "on-click" = "waybar-mpris --send toggle";
          "on-click-right" = "waybar-mpris --send player-next";
          max-length = 25;
          "escape" = true;
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
        };
        "network" = {
          "format-wifi" = "";
          "format-ethernet" = "";
          "tooltip-format" = "via {gwaddr} {ifname}";
          "format-linked" = "";
          "format-disconnected" = "No Conn";
          "format-alt" = "   ";
        };

        "custom/power_menu" = {
          format = "";
          #on-click="~/.local/bin/powermenu";
          escape = true;
          tooltip = false;
        };

        "wlr/workspaces" = {
          "format" = "{icon}";
          "format-active" = " {icon} ";
          "on-click" = "activate";
        };
        "clock" = {
          # timezone = "America/New_York";
          tooltip-format = "<big>{:%d/%m}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%I:%M}";
          max-length = 25;
        };

        "custom/weather" = {
          format = "{}";
          tooltip = true;
          interval = 1800;
          exec = "$HOME/.config/waybar/scripts/wttr.py";
          return-type = "json";
        };
        "wireplumber" = {
          "format" = "{volume}% {icon}";
          "format-muted" = "";
          "on-click" = "${pkgs.pavucontrol}/bin/pavucontrol";
          "format-icons" = [
            ""
            ""
            ""
          ];
        };
        "keyboard-state" = {
          "numlock" = true;
          "capslock" = true;
          "format" = "《{name} {icon}》";
          "format-icons" = {
            "locked" = "";
            "unlocked" = "";
          };
        };

        "cpu" = {
          interval = 1;
          format = "{icon0} {icon1} {icon2} {icon3}";
          format-icons = [
            "▁"
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
          min-length = 6;
        };

        tray = {
          icon-size = 16;
          spacing = 0;
        };
      };
    };

    style = ''

      * {
          font-family: FiraCode, Noto Sans,FontAwesome, Roboto, Helvetica, Arial, sans-serif;
          font-size: 12px;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #custom-expand,
      #custom-cycle_wall,
      #custom-ss,
      #custom-waybar-mpris,
      #custom-power_menu,
      #keyboard-state,
      #wireplumber,
      #mpd {
          padding: 0 10px;
          border-radius: 12px;
          margin-top: 5px;
          margin-bottom: 10px;
          margin-right: 5px;
      }

      window#waybar {
          background-color: transparent;
      }

      #custom-waybar-mpris label {
          font-weight: bold;
      }

      #custom-waybar-mpris.paused label {
          font-weight: bolder;
      }

      #workspaces button label{
          font-weight: bolder;
      }

      #workspaces button.active label{
          font-weight: bolder;
      }

      #workspaces{
          background-color: transparent;
      }
      #workspaces button{
          border-radius: 15px;
          margin-right: 10px;
          padding-left: 7px;
          padding-right: 7px;
          font-weight: bolder;
          transition: all 0.5s cubic-bezier(.55,-0.68,.48,1.68);
      }

      #workspaces button.active{
          padding-right: 20px;
          padding-left: 20px;
          background-size: 400% 400%;
          animation: gradient_f 20s ease-in-out infinite;
          transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
      }

      @keyframes gradient {
      	0% {
      		background-position: 0% 50%;
      	}
      	50% {
      		background-position: 100% 30%;
      	}
      	100% {
      		background-position: 0% 50%;
      	}
      }

      @keyframes gradient_f {
      	0% {
      		background-position: 0% 200%;
      	}
          50% {
              background-position: 200% 0%;
          }
      	100% {
      		background-position: 400% 200%;
      	}
      }

      @keyframes gradient_f_nh {
      	0% {
      		background-position: 0% 200%;
      	}
      	100% {
      		background-position: 200% 200%;
      	}
      }




      #custom-waybar-mpris.playing{
          background-size: 400% 400%;
          animation: gradient_f 9s cubic-bezier(.72,.39,.21,1) infinite;
          font-weight: bold;
      }

      #custom-waybar-mpris.paused{
          font-weight: bolder;
      }

      #clock label{
          font-weight:  bolder;
      }

      #clock {

          background-size: 200% 300%;

          animation: gradient_f_nh 4s linear infinite;

          font-weight: bolder;
      }


      @keyframes blink {
          to {
              background-color: #f9e2af;
              color:#96804e;
          }
      }

      #cpu label{
      }

      #cpu {
      }

      #network{
      }

      #network.disabled{
      }

      #network.disconnected{
          font-weight: bolder;
          padding-top: 3px;
          padding-right: 11px;
      }

      #network.linked, #network.wifi{
      }

      #network.ethernet{
      }

      #wireplumber {
          font-weight: bolder;
      }


      #tray {
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
      }
    '';
  };
}
