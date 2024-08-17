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
  $term = kitty
  $launcher = walker

  # Scripts
  $random_wallpaper = /etc/nixos/home/waltz/dotfiles/hyprland/scripts/random_wallpaper.sh
  $update_colorscheme = /etc/nixos/home/waltz/dotfiles/hyprland/scripts/update_colorscheme.sh
  $music_status = /etc/nixos/home/waltz/dotfiles/ncmpcpp/scripts/song_info.sh
  $wallpaper_picker = $(kitty --detach --class=selector yazi ~/img/wallpapers)
  $media_keys = /etc/nixos/home/waltz/dotfiles/hyprland/scripts/media_keys.sh

  # Predefined commands
  $notify-low = dunstify -u low -t 600
  $get-workspace-name = hyprctl workspaces | awk '/workspace ID -[0-9]+ \(special:/ {print $4}' | sed 's/[()]//g' | sed 's/special://' | walker -d -f -p "special workspace"

  # Start
  exec-once = swww-daemon --format xrgb &

  # Monitor
  #monitor=eDP-1,1366x768@60.06,0x0,1.0,bitdepth,10
  monitor= , highres, auto, 1

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

  gestures {
    workspace_swipe = true
  }

  # Plugins
  plugin {
    hyprwinwrap {  class = kitty-bg }
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
    allow_tearing = false

    # Border colors
    col.active_border = $accent $accentAlpha 45deg
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
    drop_shadow = yes
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
  }

  # Blur layers
  layerrule = blur,waybar
  layerrule = blur,launcher

  misc {
      # Enable vfr (lower refresh rate when nothing is hapenning on the screen)
      vfr = true

      # Adptative sync
      vrr = 1

      # Animate window resizing
      animate_manual_resizes = true

      # Enable widnow swallowing
      enable_swallow = true
      swallow_regex = ^(kitty)$

      # (buggy) try to reduce delay rendering before the monitor
      render_ahead_of_time = false
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
    no_gaps_when_only = false
  }

  # Lock screen
  bind	= $MOD SHIFT, L, exec, loginctl lock-session

  # Wallpaper picker
  bind = $MOD SHIFT, P, exec, $wallpaper_picker

  # Main Keybindings
  bind = $MOD, T, exec, $term
  bind = $MOD, Space, exec, $launcher
  bind = $MOD, Q, killactive
  bind = $MOD SHIFT CTRL, E, exit

  # Mpris
  bind = ,XF86AudioPlay, exec, $media_keys "play" play-pause
  binde = ,XF86AudioNext, exec, $media_keys "play" position 5+
  bind = $MOD, XF86AudioNext, exec, $media_keys "play" next
  bind = $MOD, XF86AudioPrev, exec, $media_keys "play" previous
  binde = ,XF86AudioPrev, exec, $media_keys "play" position 5-

  # Control screen brightness
  binde = ,XF86MonBrightnessUp,   exec, $media_keys "bright" 10+
  binde = ,XF86MonBrightnessDown, exec, $media_keys "bright" 10-

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

  # Resize MODe
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
  windowrulev2 = float, class:^(selector)$
  windowrulev2 = pin, class:^(selector)$
  windowrulev2 = size 50% 50%, class:^(selector)$
  windowrulev2 = center 1, class:^(selector)$


  # Disable xray on terminal windows
  # This probably have some performance impact
  # Only use this while using hyprwinwrap
  # windowrulev2 = xray 0, class:^(kitty)$

  opengl {
    force_introspection = 1
  }

  debug {
    damage_tracking = 2
  }

  misc {
    force_default_wallpaper = 0
    animate_manual_resizes = true
  }
''
