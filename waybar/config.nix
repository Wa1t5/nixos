[
{
    # Waybar layer and position
    layer = "top";
    position = "top";  # (top|bottom|left|right)

    # Size
    height = 4;  # Waybar height (to be removed for auto height)
    width = 1366; # Waybar width
    spacing = 4;  # Gaps between modules (4px)

    # Modules left
    modules-left = [ "hyprland/workspaces" ];

    # Modules center
    #modules-center = [ "custom/music" ];

    # Modules right
    modules-right = [ "tray" "clock" "custom/calendar" "battery" "temperature" ];

    # MODULES CONFIG

    # Custom/bar = Clock
    "custom/clock" = {
		    exec = "/etc/nixos/waybar/scripts/bar.sh clock";
    };

    # Clock
    "clock" = {
        interval = 60;
        format = "{:%H:%M} ";
        max-length = 25;
    };

    # Custom/bar = Calendar
    "custom/calendar" = {
		    exec = "/etc/nixos/waybar/scripts/bar.sh calendar";
    };

    # Custom/bar = Battery
    "custom/battery" = {
		    exec = "/etc/nixos/waybar/scripts/bar.sh  battery";
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
		    exec = "/etc/nixos/waybar/scripts/bar.sh temperature";
    };
	
    # Temperature
    temperature = {
        thermal-zone = 0;
        hwmon-path-abs = "/sys/devices/pci0000:00/0000:00:18.3/hwmon/";
        input-filename = "temp1_input";
        critical-threshold = 80;
        format-critical = "{temperatureC}°C ";
        format = "{temperatureC}°C ";
    };

    # Custom/bar = Music
	  "custom/music" = {
	     exec = "/etc/nixos/waybar/scripts/bar.sh  music";
		     #on-click = "music pause";
    };

	# Hyprland workspaces
	"hyprland/workspaces" = {
		format = "{icon}";
	  format-icons = {
        active = " ";
        default = "";
    };
	};
}
]
