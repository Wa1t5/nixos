''
  # __          __   _ _       _       _    _                  _                 _    _____             __ _
  # \ \        / /  | | |     ( )     | |  | |                | |               | |  / ____|           / _(_)
  #  \ \  /\  / /_ _| | |_ ___|/ ___  | |__| |_   _ _ __  _ __| | __ _ _ __   __| | | |     ___  _ __ | |_ _  __ _
  #   \ \/  \/ / _` | | __|_  / / __| |  __  | | | | '_ \| '__| |/ _` | '_ \ / _` | | |    / _ \| '_ \|  _| |/ _` |
  #    \  /\  / (_| | | |_ / /  \__ \ | |  | | |_| | |_) | |  | | (_| | | | | (_| | | |___| (_) | | | | | | | (_| |
  #     \/  \/ \__,_|_|\__/___| |___/ |_|  |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|  \_____\___/|_| |_|_| |_|\__, |
  #                                            __/ | |                                                        __/ |
  #                                           |___/|_|                                                       |___/
  ###################################################################################################################

  # Keys
  $MOD = SUPER

  # Applications
  $term = ghostty 
  #$launcher = rofi -show drun
  $launcher-dmenu = rofi -dmenu -p
  $launcher = vicinae toggle

  # Scripts
  $random_wallpaper = /etc/nixos/home/waltz/dotfiles/hyprland/scripts/random_wallpaper.sh
  $update_colorscheme = /etc/nixos/home/waltz/dotfiles/hyprland/scripts/update_colorscheme.sh
  $music_status = /etc/nixos/home/waltz/dotfiles/ncmpcpp/scripts/song_info.sh
  $wallpaper_picker = $(kitty --detach --class=selector yazi ~/img/wallpapers)
  #$wallpaper_picker = $(foot --app-id=selector yazi ~/img/wallpapers)
  $clipboard_history = $(foot --app-id=selector clipse)
  $media_keys = /etc/nixos/home/waltz/dotfiles/hyprland/scripts/media_keys.sh

  # Predefined commands
  $notify-low = dunstify -u low -t 600
  $get-workspace-name = hyprctl workspaces | awk '/workspace ID -[0-9]+ \(special:/ {print $4}' | sed 's/[()]//g' | sed 's/special://' | $launcher-dmenu "special workspace"

  # Start
  exec-once = swww-daemon --format xrgb &
  exec-once = hyprlock &
  exec-once = syshud &
  exec-once = sleep 30 && hyprctl hyprsunset temperature $(cat ~/.config/hypr/screen-temperature)

  # Move workspace 1 to HDMI monitor
  exec-once = hyprctl dispatch workspace 1
  exec-once = hyprctl dispatch moveworkspacetomonitor 1 HDMI-A-1
  exec-once = $term

  # Monitor
  monitorv2 {
    output = HDMI-A-1
    mode = 1920x1080@120
    position = 0x0
    scale = 1
  }

  monitorv2 {
    output = eDP-1
    mode = 1366x768@60
    position = 1920x0
    scale = 1
  }

  # Workspaces
  workspace = 0, monitor:eDP-1
  workspace = 1, monitor:HDMI-A-1
  workspace = 2, monitor:HDMI-A-1
  workspace = 3, monitor:HDMI-A-1
  workspace = 4, monitor:HDMI-A-1
  workspace = 5, monitor:HDMI-A-1
  workspace = 6, monitor:eDP-1
  workspace = 7, monitor:eDP-1
  workspace = 8, monitor:eDP-1
  workspace = 9, monitor:eDP-1

  # Input
  input {
    # Keyboard
    kb_layout = br
    kb_variant = abnt2
    follow_mouse = 1

    # Touchpad
    touchpad {
      disable_while_typing = true
      natural_scroll = true
      middle_button_emulation = true
    }
  }

  # Touchpad gestures
  gestures {
    workspace_swipe_invert = false
    workspace_swipe_distance = 700
    gesture= 3, horizontal, workspace
  }

  # Plugins
  plugin {
    hyprwinwrap { class = kitty-bg }
    overview {
      panelHeight = 100
      hideTopLayers = true;
    }
  }

  # General
  general {
    # Gaps
    gaps_in = 5
    gaps_out = 3
    border_size = 2

    # Layout
    layout = dwindle

    # Allow tearing
    allow_tearing = true

    # Border colors
    #col.active_border = $accent $accent 45deg
  }

  # Decoration
  decoration {
    # Border rounding
    rounding = 7

    # Blur
    blur {
      enabled = true
      size = 5
      passes = 1
      xray = false
      new_optimizations = true
    }

    # Shadows
    shadow {
      enabled = true
      range = 4
      render_power = 3
      color = rgba(1a1a1aee)
    }
  }

  # Blur layers
  layerrule = blur on, match:namespace waybar
  layerrule = blur on, match:namespace launcher
  layerrule = blur on, match:namespace vicinae

  misc {
      # Enable vfr 
      vfr = true

      # Variable refresh rate
      #vrr = 1

      # Animate window resizing
      animate_manual_resizes = true

      # Enable widnow swallowing
      enable_swallow = true
      swallow_regex = ^(kitty)$
      swallow_regex = ^(foot)$
      swallow_regex = ^(alacritty)$

      # Avoid getting locked out if lockscreen app crashed
      allow_session_lock_restore = true;
  }

  # Animations
  animations {
    # Window: open, close, move
    animation = windowsIn, 1, 2, default, popin 20%
    animation = windowsOut, 1, 2, default, popin 80%
    animation = windowsMove, 1, 5, default, slide

    # Fade: in, out
    animation = fadeIn, 1, 5, default
    animation = fadeOut, 1, 5, default

    # Border
    animation = border, 1, 20, default

    # Workspaces
    animation = workspaces, 1, 3, default, slide
  }

  dwindle {
    pseudotile = yes
    preserve_split = yes
    force_split = 2
    #no_gaps_when_only = false
  }

  # Lock screen
  bind	= $MOD SHIFT, L, exec, loginctl lock-session

  # Wallpaper picker
  bind = $MOD SHIFT, P, exec, $wallpaper_picker

  # Clipboard history
  bind = $MOD SHIFT, V, exec, $clipboard_history

  # Main Keybindings
  bind = $MOD, T, exec, $term
  bind = $MOD, Space, exec, $launcher
  bind = $MOD, Q, killactive
  bind = $MOD SHIFT CTRL, E, exit

  # Workspace overview
  #bind = $MOD, Tab, overview:toggle

  # Mpris
  bind =  , XF86AudioPlay, exec, $media_keys "play" play-pause
  binde = $MOD, XF86AudioNext, exec, $media_keys "play" position 5+
  binde = $MOD, XF86AudioPrev, exec, $media_keys "play" position 5-
  bind = , XF86AudioNext, exec, $media_keys "play" next
  bind = , XF86AudioPrev, exec, $media_keys "play" previous

  # Control screen brightness
  binde = ,XF86MonBrightnessUp,   exec, $media_keys "bright" 10%+
  binde = ,XF86MonBrightnessDown, exec, $media_keys "bright" 10%-

  # Control screen temperature with hyprsunset
  binde = $MOD ,XF86MonBrightnessUp,   exec, $media_keys "temp" +1000
  binde = $MOD ,XF86MonBrightnessDown, exec, $media_keys "temp" -1000

  # Volume
  binde = ,XF86AudioRaiseVolume, exec, $media_keys "vol" @DEFAULT_AUDIO_SINK@ 0.05+
  binde = ,XF86AudioLowerVolume, exec, $media_keys "vol" @DEFAULT_AUDIO_SINK@ 0.05-

  # Microphone volume
  binde = $MOD, XF86AudioRaiseVolume, exec, $media_keys "vol" @DEFAULT_AUDIO_SOURCE@ 0.05+
  binde = $MOD, XF86AudioLowerVolume, exec, $media_keys "vol" @DEFAULT_AUDIO_SOURCE@ 0.05-

  # Togle Audio | Mic
  bind = ,XF86AudioMute, exec, $media_keys "vol-mute" @DEFAULT_AUDIO_SINK@
  bind = $MOD,XF86AudioMute, exec, $media_keys "vol-mute" @DEFAULT_AUDIO_SOURCE@

  # Screenshot
  bind = $MOD, s, exec, grim - | wl-copy -t image/png && $notify-low "Screenshot" "Fullscreen"
  bind = $MOD SHIFT, s, exec, grim -g "$(slurp)" - | wl-copy -t image/png && $notify-low "Screenshot" "Partial"

  # Toggle Floating
  bind = $MOD SHIFT, space, togglefloating, active

  # Pin window
  bind = $MOD, p, pin, active

  # Move window
  bind = $MOD SHIFT, left, movewindow, l
  bind = $MOD SHIFT, right, movewindow, r
  bind = $MOD SHIFT, up, movewindow, u
  bind = $MOD SHIFT, down, movewindow, d

  # Make window fullscreen
  bind = $MOD, f, fullscreen, active

  # Resize mode
  bind = $MOD, r, submap, resize
  submap = resize

  binde = , right, resizeactive, 10 0
  binde = , left, resizeactive, -10 0
  binde = , up, resizeactive, 0 -10
  binde = , down, resizeactive, 0 10

  bind = , escape, submap, reset
  submap = reset

  # Move focus with mainMod + arrow keys
  bind = $MOD, left, movefocus, l
  bind = $MOD, right, movefocus, r
  bind = $MOD, up, movefocus, u
  bind = $MOD, down, movefocus, d

  # Switch workspaces with mainMod + [0-9]
  bind = $MOD, 1, workspace, 1
  bind = $MOD, 2, workspace, 2
  bind = $MOD, 3, workspace, 3
  bind = $MOD, 4, workspace, 4
  bind = $MOD, 5, workspace, 5
  bind = $MOD, 6, workspace, 6
  bind = $MOD, 7, workspace, 7
  bind = $MOD, 8, workspace, 8
  bind = $MOD, 9, workspace, 9
  bind = $MOD, 0, workspace, 10

  # Move active window to a workspace with mainMod + SHIFT + [0-9]
  bind = $MOD SHIFT, 1, movetoworkspacesilent, 1
  bind = $MOD SHIFT, 2, movetoworkspacesilent, 2
  bind = $MOD SHIFT, 3, movetoworkspacesilent, 3
  bind = $MOD SHIFT, 4, movetoworkspacesilent, 4
  bind = $MOD SHIFT, 5, movetoworkspacesilent, 5
  bind = $MOD SHIFT, 6, movetoworkspacesilent, 6
  bind = $MOD SHIFT, 7, movetoworkspacesilent, 7
  bind = $MOD SHIFT, 8, movetoworkspacesilent, 8
  bind = $MOD SHIFT, 9, movetoworkspacesilent, 9
  bind = $MOD SHIFT, 0, movetoworkspacesilent, 10

  # Activate special workspace
  bind = $MOD, W, exec, hyprctl dispatch togglespecialworkspace $($get-workspace-name)

  # Move window to special workspace
  bind = $MOD SHIFT, W, exec, hyprctl dispatch movetoworkspacesilent special:$($get-workspace-name)

  # Scroll through existing workspaces with mainMod + scroll
  bind = $MOD, mouse_down, workspace, e+1
  bind = $MOD, mouse_up, workspace, e-1

  # Move/resize windows with mainMod + LMB/RMB and dragging
  bindm = $MOD, mouse:272, movewindow
  bindm = $MOD, mouse:273, resizewindow

  # Window rules to allow selector classes to be floating
  windowrule {
    name = "Adjust terminal for selector like dialogue"
    match:class = ^(selector)$
    float = true
    pin = true 
    size = 50% 50%
    center = true
  }

  # Set steam games as games to enable direct_scanout
  windowrule {
    name = "Direct scanout for steam games"
    match:initial_class = ^(steam_app_.*)$
    content = game
    immediate = true
    no_anim = true
    no_blur = true
    no_dim = true
    decorate = false
    idle_inhibit = focus
    fullscreen_state = 3 3
    fullscreen = true
  }

  # Disable xray on terminal windows
  # This probably have some performance impact
  # Only use this while using hyprwinwrap
  # windowrule = xray 0, class:^(kitty)$

  # Render
  render {
    new_render_scheduling = true
    direct_scanout = 2
  }

  debug {
    damage_tracking = 2
  }

  misc {
    force_default_wallpaper = 0
    animate_manual_resizes = true
  }
''
