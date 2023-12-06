[
    {
    # Waybar layer and position
    layer = "top";
    position = "top";  # (top|bottom|left|right)

    # Size
    height = 1;  # Waybar height (to be removed for auto height)
    width = 1366; # Waybar width
    spacing = 4;  # Gaps between modules (4px)

    # Modules left
    modules-left = [ "clock" "hyprland/workspaces" ];

    # Modules center
    modules-center = [ "mpd" ];

    # Modules right
    modules-right = [ "cava" "tray"  "battery" "temperature" ];

    # MODULES CONFIG

    # Clock
    "clock" = {
        format = "{:%H:%M}  ";
        format-alt = "{:%A, %B %d, %Y (%R)}  ";
        tooltip-format = "<tt><small>{calendar}</small></tt>";
        calendar = {
            mode          = "year";
            mode-mon-col  = 3;
            weeks-pos     = "right";
            on-scroll     = 1;
            on-click-right = "mode";
            format = {
                months =     "<span color='#ffead3'><b>{}</b></span>";
                days =       "<span color='#ecc6d9'><b>{}</b></span>";
                weeks =      "<span color='#99ffdd'><b>W{}</b></span>";
                weekdays =   "<span color='#ffcc66'><b>{}</b></span>";
                today =      "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
        };
        actions = {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
        };
    };
    
     # Battery
    battery = {
   	    bat = "BAT0";
        interval = 60;
    	  states = {
            warning = 30;
            critical = 15;
    	  };
    	  format = "{capacity}% {icon}";
    	  format-icons = ["" "" "" "" ""];
    	  max-length = 25;
	  };

    # Custom/bar = Temperature
    "custom/temperature" = {
		    exec = "/etc/nixos/home/waltz/waybar/scripts/bar.sh temperature";
    };
	
    # Temperature
    "temperature" = {
        thermal-zone = 0;
        hwmon-path-abs = "/sys/devices/pci0000:00/0000:00:18.3/hwmon/";
        input-filename = "temp1_input";
        critical-threshold = 80;
        format-critical = "{temperatureC}°C ";
        format = "{temperatureC}°C ";
    };

    # Hyprland workspaces
    "hyprland/workspaces" = {
	      format = "{icon}";
        persistent-workspaces = {
            "*" = [ 0 1 2 3 4 5 6 7 8 9 0 ];
        };
        format-icons = {
            active = " ";
            default = "";
        };
	  };

    # Music player daemon
    "mpd" = {
        format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon} {title}";
        format-disconnected = "Disconnected";
        format-stopped = "Stopped";
        interval = 10;

        title-len = 35;
        
        consume-icons = {
            on = " ";
        };
        random-icons = {
            off = "<span color=\"#f53c3c\"></span> ";
            on =  " ";
        };
        repeat-icons = {
            on = " ";
        };
        single-icons = {
            on = "1 ";
        };
        state-icons = {
            playing = "";
            paused = "";
        };
        tooltip-format = "MPD (connected)";
        tooltip-format-disconnected = "MPD (disconnected)";
    };

    # Cava
    "cava" = {
        framerate = 30;
        autosens = 1;
        sensitivity = 5;
        bars = 16;
        lower_cutoff_freq = 50;
        higher_cutoff_freq = 10000;
        method = "pipewire";
        source = "auto";
        stereo = true;
        reverse = false;
        bar_delimiter = 0;
        monstercat = false;
        waves = false;
        input_delay = 4;
        format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
    };
}
]
