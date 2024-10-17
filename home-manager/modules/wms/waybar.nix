{pkgs, ...}:{
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
        modules-right = ["network" "cpu" "wireplumber" "clock" "tray" 
#"custom/power_menu"
];
        
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
        "format-disconnected"= "No Conn";
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
"wireplumber"= {
    "format"= "{volume}% {icon}";
    "format-muted"= "";
    "on-click"= "${pkgs.pavucontrol}/bin/pavucontrol";
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
/*
* Variant: Rosé Pine
* Maintainer: DankChoir
*/

@define-color base            #191724;
@define-color surface         #1f1d2e;
@define-color overlay         #26233a;

@define-color muted           #6e6a86;
@define-color subtle          #908caa;
@define-color text            #e0def4;

@define-color love            #eb6f92;
@define-color gold            #f6c177;
@define-color rose            #ebbcba;
@define-color pine            #31748f;
@define-color foam            #9ccfd8;
@define-color iris            #c4a7e7;

@define-color highlightLow    #21202e;
@define-color highlightMed    #403d52;
@define-color highlightHigh   #524f67;


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
    background: @surface;
    color: @foam;
    box-shadow: @base 2 2 5 2px;
    margin-top: 10px;
    margin-bottom: 10px;
    margin-right: 10px;
}

window#waybar {
    background-color: transparent;
}

#custom-waybar-mpris label {
    color: @foam;
    font-weight: bold;
}

#custom-waybar-mpris.paused label {
    color: @pine;
    font-weight: bolder; 
}

#workspaces button label{
    color: 	@love ;
    font-weight: bolder;
}

#workspaces button.active label{
    color: @base;
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
    box-shadow: @base 2 2 5 2px;
    background-color: @surface ;
    border-radius: 15px;
    margin-right: 10px;
    padding: 10px;
    padding-top: 4px;
    padding-bottom: 2px;
    font-weight: bolder;
    color: 	@text ;
    transition: all 0.5s cubic-bezier(.55,-0.68,.48,1.68);
}

#workspaces button.active{
    padding-right: 20px;
    box-shadow: @base 2 2 5 2px;
    padding-left: 20px;
    background: @surface;
    background: radial-gradient(circle, @love 0%, @gold 12%, @rose 19%, @pine 20%, @foam 24%, @iris 36%, @foam 37%, @pine 48%, @rose 52%, @gold 52%, @love 59%, @gold 66%, @rose 67%, @pine 68%, @foam 77%, @iris 78%, @foam 82%, @pine 83%, @rose 90%, @gold 100%); 
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
    background: radial-gradient(circle, @iris 0%, @foam 6%, @love 14%,  @iris 14%, @foam 18%, @pine 28%, @love 28%, @iris 58%, @foam 69%, @pine 69%, @foam 72%, @foam 73%, @pine  78%, @base 100%) ;    
    background-size: 400% 400%;
    animation: gradient_f 9s cubic-bezier(.72,.39,.21,1) infinite;
    text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
    font-weight: bold;
    color: @base ;
}

#custom-waybar-mpris.paused{
    background: @surface ;
    font-weight: bolder;
    color: @text;
}

#clock label{
    color: @text;
    font-weight:  bolder;
}

#clock {
    background: @surface;
    background: linear-gradient(118deg, @iris 5%, @surface 5%, @surface 20%, @iris 20%, @iris 40%, @surface 40%, @surface 60%, @iris 60%, @iris 80%, @surface 80%, @surface 95%, @iris 95%);

    background-size: 200% 300%;

    animation: gradient_f_nh 4s linear infinite;
    margin-right: 25px;
    color: @text ;
    text-shadow: 0 0 5px @subtle;
    
    font-size: 15px;
    padding-top: 5px;
    padding-right: 21px;
    font-weight: bolder;
    padding-left: 20px;
}


@keyframes blink {
    to {
        background-color: #f9e2af;
        color:#96804e;
    }
}

#cpu label{
    color: @text;
}

#cpu {
    background: @surface;
    background: radial-gradient(circle, @surface 30%, @overlay 100%); 
    color: 	@text;
}

#network{
    color: @base;
}

#network.disabled{
    background-color: @surface;
}

#network.disconnected{
    background: @love;
    background: linear-gradient(45deg, @love 0%, @gold 100%); 
    color: @text;
    font-weight: bolder;
    padding-top: 3px;
    padding-right: 11px;
}

#network.linked, #network.wifi{
    background-color: @rose ;
}

#network.ethernet{
    background-color: @pine ;
}

#wireplumber {
    background-color:  	@surface;
    color: @text;
    font-weight: bolder;
}


#tray {
    background-color: @surface;
}

#tray > .passive {
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
    background-color: @rose;
}

      '';
  };
}
