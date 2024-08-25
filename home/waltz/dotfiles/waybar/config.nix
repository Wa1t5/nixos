[
  {
    # Waybar layer and position
    layer = "top";
    position = "top"; # (top|bottom|left|right)

    # Size
    height = 1; # Waybar height (to be removed for auto height)
    width = 1366; # Waybar width
    spacing = 4; # Gaps between modules (4px)

    # Modules left
    modules-left = [ "clock" "battery" "idle_inhibitor" "hyprland/workspaces" ];

    # Modules center
    modules-center = [ "mpris" ];

    # Modules right
    modules-right = [ "tray" "pulseaudio" "backlight" "cpu" "temperature" ];

    # MODULES CONFIG

    # Clock
    "clock" = {
      format = "{:%H:%M} ";
      format-alt = "{:%A, %B %d, %Y (%R)}";
      tooltip-format = "<tt><small>{calendar}</small></tt>";
      calendar = {
        mode = "year";
        mode-mon-col = 3;
        weeks-pos = "right";
        on-scroll = 1;
        on-click-right = "mode";
        format = {
          months = "<span color='#ffead3'><b>{}</b></span>";
          days = "<span color='#ecc6d9'><b>{}</b></span>";
          weeks = "<span color='#99ffdd'><b>W{}</b></span>";
          weekdays = "<span color='#ffcc66'><b>{}</b></span>";
          today = "<span color='#ff6699'><b><u>{}</u></b></span>";
        };
      };
      actions = {
        on-click-right = "mode";
      };
    };

    battery = {
      bat = "BAT0";
      interval = 60;
      states = {
        warning = 30;
        critical = 15;
      };
      format = "{capacity}% {icon}";
      format-icons = [ " " " " " " " " " " ];
      max-length = 25;
    };

    "temperature" = {
      thermal-zone = 0;
      hwmon-path-abs = "/sys/devices/pci0000:00/0000:00:18.3/hwmon/";
      input-filename = "temp1_input";
      critical-threshold = 80;
      format-critical = "{temperatureC}°C ";
      format = "{temperatureC}°C ";
    };

    "hyprland/workspaces" = {
      format = "{icon}";
      #persistent-workspaces = {
      #  "*" = 10;
      #};
      format-icons = {
        active = " ";
        default = "";
      };
    };

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
        on = " ";
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

    "cava" = {
      framerate = 25;
      autosens = 1;
      sensitivity = 1;
      bars = 10;
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

    "mpris" = {
      format = "{status_icon} {title}";
      format-paused = "{status_icon} {title}";
      format-stopped = "{status}";
      title-len = 30;
      player-icons = {
        "default" = "▶";
        "mpv" = "🎵";
      };
      status-icons = {
        "paused" = " ";
        "playing" = " ";
      };
    };

    "cpu" = {
      format = "{usage}% {icon}";
      format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
      interval = 10;
      max-length = 10;
    };

    "pulseaudio" = {
      format = "{volume}% {icon}";
      format-bluetooth = "{volume}% {icon}";
      format-icons = {
        car = "";
        default = [ "" "" ];
        hands-free = "";
        headphone = "";
        headset = "";
        phone = "";
        portable = "";
      };
      format-muted = "";
      ignored-sinks = [ "Easy Effects Sink" ];
      on-click = "pavucontrol";
      scroll-step = 1;
    };

    "backlight" = {
      format = "{percent}% {icon}";
      format-icons = [ "" "" ];
    };

    "tray" = {
      "spacing" = 5;
    };

    "idle_inhibitor" = {
      format = "{icon}";
      format-icons = {
        activated = " ";
        deactivated = " ";
      };
    };

  }
]
