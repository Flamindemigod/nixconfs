{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
	height = 50;
	spacing = 5;
	margin-bottom = -11;

        modules-left = ["hyprland/workspaces"];
        modules-center = ["custom/waybar-mpris"];
        modules-right = ["network" "cpu" "wireplumber" "clock" "tray" "custom/power_menu"];
        
"custom/waybar-mpris"= {
    "return-type"= "json";
exec = "waybar-mpris --autofocus --pause \"󰏤 \"";    
"on-click"= "waybar-mpris --send toggle";
    "on-click-right"= "waybar-mpris --send player-next";
max-length = 40;
    "escape"= true;
};

"hyprland/workspaces" = {
          disable-scroll = true;
        };
    "network"= {
        "format-wifi"= "";
        "format-ethernet"= "";
        "tooltip-format"= "via {gwaddr} {ifname}";
        "format-linked"= "";
        "format-disconnected"= "wifi";
        "format-alt"= "   ";
    };

    	"custom/power_menu" = {
		format="";
		#on-click="~/.local/bin/powermenu";
		escape= true;
		tooltip= false;
	};

    "wlr/workspaces"= {
        "format"= "{icon}";
        "format-active"= " {icon} ";
        "on-click"= "activate";
};
"clock" = {
        # timezone = "America/New_York";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
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
"wireplumber"= {
    "format"= "{volume}% {icon}";
    "format-muted"= "";
    "on-click"= "pavcontrol";
    "format-icons"= ["" "" ""];
};
    "keyboard-state"= {
        "numlock"= true;
        "capslock"= true;
        "format"= "{name} {icon}";
        "format-icons"= {
            "locked"= "";
            "unlocked"= "";
        };    };
 
    "cpu" = {
      interval = 1;
        format="{icon0} {icon1} {icon2} {icon3}";
        format-icons=["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
      min-length = 6;
    };

    tray = {
        icon-size = 16;
        spacing = 0;
    };

      };
    };
  
    style = 
      ''
* {
    font-family: FiraCode, Noto Sans,FontAwesome, Roboto, Helvetica, Arial, sans-serif;
    font-size: 13px;
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
    border-radius: 15px;
    background: #11111b;
    color: #b4befe;
    box-shadow: rgba(0, 0, 0, 0.116) 2 2 5 2px;
    margin-top: 10px;
    margin-bottom: 10px;
    margin-right: 10px;
}

window#waybar {
    background-color: transparent;
}

#custom-waybar-mpris label {
    color: #11111b;
    font-weight: bold;
}

#custom-waybar-mpris.paused label {
    color: 	#89b4fa ;
    font-weight: bolder; 
}

#workspaces button label{
    color: 	#89b4fa ;
    font-weight: bolder;
}

#workspaces button.active label{
    color: #11111b;
    font-weight: bolder;
}

#workspaces{
    background-color: transparent;
    margin-top: 10px;
    margin-bottom: 10px;
    margin-right: 10px;
    margin-left: 25px;
}
#workspaces button{
    box-shadow: rgba(0, 0, 0, 0.116) 2 2 5 2px;
    background-color: #11111b ;
    border-radius: 15px;
    margin-right: 10px;
    padding: 10px;
    padding-top: 4px;
    padding-bottom: 2px;
    font-weight: bolder;
    color: 	#89b4fa ;
    transition: all 0.5s cubic-bezier(.55,-0.68,.48,1.68);
}

#workspaces button.active{
    padding-right: 20px;
    box-shadow: rgba(0, 0, 0, 0.288) 2 2 5 2px;
    padding-left: 20px;
    padding-bottom: 3px;
    background: rgb(203,166,247);
    background: radial-gradient(circle, rgba(203,166,247,1) 0%, rgba(193,168,247,1) 12%, rgba(249,226,175,1) 19%, rgba(189,169,247,1) 20%, rgba(182,171,247,1) 24%, rgba(198,255,194,1) 36%, rgba(177,172,247,1) 37%, rgba(170,173,248,1) 48%, rgba(255,255,255,1) 52%, rgba(166,174,248,1) 52%, rgba(160,175,248,1) 59%, rgba(148,226,213,1) 66%, rgba(155,176,248,1) 67%, rgba(152,177,248,1) 68%, rgba(205,214,244,1) 77%, rgba(148,178,249,1) 78%, rgba(144,179,250,1) 82%, rgba(180,190,254,1) 83%, rgba(141,179,250,1) 90%, rgba(137,180,250,1) 100%); 
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



#custom-waybar-mpris.low{
    background: rgb(148,226,213);
    background: linear-gradient(52deg, rgba(148,226,213,1) 0%, rgba(137,220,235,1) 19%, rgba(116,199,236,1) 43%, rgba(137,180,250,1) 56%, rgba(180,190,254,1) 80%, rgba(186,187,241,1) 100%); 
    background-size: 300% 300%;
    text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
    animation: gradient 15s ease infinite;
    font-weight: bolder;
    color: #fff;
}
#custom-waybar-mpris.normal{
    background: rgb(148,226,213);
    background: radial-gradient(circle, rgba(148,226,213,1) 0%, rgba(156,227,191,1) 21%, rgba(249,226,175,1) 34%, rgba(158,227,186,1) 35%, rgba(163,227,169,1) 59%, rgba(148,226,213,1) 74%, rgba(164,227,167,1) 74%, rgba(166,227,161,1) 100%); 
    background-size: 400% 400%;
    animation: gradient_f 4s ease infinite;
    text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
    font-weight: bolder;
    color: #fff;
}
#custom-waybar-mpris.critical{
    background: rgb(235,160,172);
    background: linear-gradient(52deg, rgba(235,160,172,1) 0%, rgba(243,139,168,1) 30%, rgba(231,130,132,1) 48%, rgba(250,179,135,1) 77%, rgba(249,226,175,1) 100%); 
    background-size: 300% 300%;
    animation: gradient 15s cubic-bezier(.55,-0.68,.48,1.68) infinite;
    text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
    font-weight: bolder;
    color: #fff;
}

#custom-waybar-mpris.playing{
    background: radial-gradient(circle, #C3D3E3 0%, #87CCDE 6%, #4BC5D8 14%,  #C3D3E3 14%, #6A74AA 18%, #111570 28%, rgba(158,175,249,1) 28%, #C3D3E3 58%, #A3E7FE 69%, #111570 69%, #A3E7FE 72%, rgba(137,220,235,1) 73%, #111570  78%, #000000 100%) ;    
    background-size: 400% 400%;
    animation: gradient_f 9s cubic-bezier(.72,.39,.21,1) infinite;
    text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
    font-weight: bold;
    color: #fff ;
}

#custom-waybar-mpris.paused{
    background: #11111b ;
    font-weight: bolder;
    color: #b4befe;
}

#custom-power_menu{
    background: #11111b;
    color: #89b4fa;
    font-weight:  bolder;
    padding: 5px;
    padding-left: 20px;
    padding-right: 20px;
    border-radius: 15px;
}


#custom-cycle_wall{
    background: rgb(245,194,231);
    background: linear-gradient(45deg, rgba(245,194,231,1) 0%, rgba(203,166,247,1) 0%, rgba(243,139,168,1) 13%, rgba(235,160,172,1) 26%, rgba(250,179,135,1) 34%, rgba(249,226,175,1) 49%, rgba(166,227,161,1) 65%, rgba(148,226,213,1) 77%, rgba(137,220,235,1) 82%, rgba(116,199,236,1) 88%, rgba(137,180,250,1) 95%); 
    color: #fff;
    background-size: 500% 500%;
    animation: gradient 7s linear infinite;
    font-weight:  bolder;
    border-radius: 15px;
}

#clock label{
    color: #11111b;
    font-weight:  bolder;
}

#clock {
    background: rgb(205,214,244);
    background: linear-gradient(118deg, #0519AB 5%, #000000 5%, #000000 20%, #0519AB 20%, #0519AB 40%, #000000 40%, #000000 60%, #0519AB 60%, #0519AB 80%, #000000 80%, #000000 95%, #0519AB 95%);

    background-size: 200% 300%;

    animation: gradient_f_nh 4s linear infinite;
    margin-right: 25px;
    color: #fff ;
    text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
    
    font-size: 15px;
    padding-top: 5px;
    padding-right: 21px;
    font-weight: bolder;
    padding-left: 20px;
}

#battery.charging, #battery.plugged {
    background-color: #94e2d5 ;
}

#battery {
    background-color: #11111b;
    color:#a6e3a1;
    font-weight: bolder;
    font-size: 20px;
    padding-left: 15px;
    padding-right: 15px;
}

@keyframes blink {
    to {
        background-color: #f9e2af;
        color:#96804e;
    }
}



#battery.critical:not(.charging) {
    background-color:  #f38ba8;
    color:#bf5673;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

#cpu label{
    color:#89dceb;
}

#cpu {
    background: rgb(30,30,46);
    background: radial-gradient(circle, rgba(30,30,46,1) 30%, rgba(17,17,27,1) 100%); 
    color: 	#89b4fa;
}

#memory {
    background-color: #cba6f7;
    color: 	#9a75c7;
    font-weight: bolder;
}

#disk {
    color: #964B00;
}

#backlight {
    color: #90b1b1;
}

#network{
    color:#000;
}

#network.disabled{
    background-color: #45475a;
}

#network.disconnected{
    background: rgb(243,139,168);
    background: linear-gradient(45deg, rgba(243,139,168,1) 0%, rgba(250,179,135,1) 100%); 
    color: #fff;
    font-weight: bolder;
    padding-top: 3px;
    padding-right: 11px;
}

#network.linked, #network.wifi{
    background-color: #a6e3a1 ;
}

#network.ethernet{
    background-color:#f9e2af ;
}

#pulseaudio {
    background-color:  	#fab387;
    color: #bf7d54;
    font-weight: bolder;
}

#pulseaudio.muted {
    background-color: #90b1b1;
}

#custom-media {
    color: #66cc99;
}

#custom-media.custom-spotify {
    background-color: #66cc99;
}

#custom-media.custom-vlc {
    background-color: #ffa000;
}

#temperature {
    background-color: #f9e2af;
    color:#96804e;
}

#temperature.critical {
    background-color: #f38ba8 ;
    color:#bf5673;
}

#tray {
    background-color: #2980b9;
}

#tray > .passive {
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
    background-color: #eb4d4b;
}

      '';
  };
}
