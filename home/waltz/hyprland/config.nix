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
$launcher = $(tofi-run)

# Scripts
$random_wallpaper = $(sh /etc/nixos/home/waltz/hyprland/scripts/random_wallpaper.sh)
$update_colorscheme = $(sh /etc/nixos/home/waltz/hyprland/scripts/update_colorscheme.sh)
$music_status = $(sh /etc/nixos/home/waltz/ncmpcpp/scripts/song_info.sh)

# Pywal
source=~/.cache/wal/colors-wal-hyprland.conf

# Predefined commands
$notify-low = notify-send -u low -t 600
$get-sink-volume = wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F'[. ]' '{print $3}'
$get-source-volume = wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk -F'[. ]' '{print $3}'
$get-mic-mute-status = [$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $3}') \=\= ""] && echo "Unmuted" || echo "Muted"
$get-mute-status = [$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}') \=\= ""] && echo "Unmuted" || echo "Muted"
$set-volume = wpctl set-volume
$toggle-mute = wpctl set-mute
$set-bright = brightnessctl s
$get-bright = brightnessctl g

# Lists
$player-list = mpd

# Start
exec-once = swww init # Inititialie swww daemon
exec-once = brightnessctl -r & # Restore previous backlight

# Monitor
monitor=,preferred,auto,1

# Input
input {
    kb_layout 		= br
    kb_variant		= abnt2
    follow_mouse 	= 1
}

# General
general {
		# Gaps
    gaps_in = 5
    gaps_out = 3
    border_size = 2

    # Layout
    layout = dwindle
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
        xray = true
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

    # Direct scanout attempts to reduce lag when there is only
    # one full scren application on the window (can give issues)
    no_direct_scanout = false

    # (buggy) try to reduce delay rendering before the monitor
    render_ahead_of_time = false
}

# Animations
animations {
		# Window: open, close, move
    animation = windowsIn, 1, 4, default, popin 80%
    animation = windowsOut, 1, 4, default, popin 30%
		animation = windowsMove, 1, 5, default, slide

		# Fade: in, out
    animation = fadeIn, 1, 10, default
		animation = fadeOut, 1, 7, default

		# Border
    animation = border, 1, 20, default

		# Workspaces
    animation = workspaces, 1, 3, default, slide
}

dwindle {
		pseudotile			= yes
  	preserve_split 		= yes
		force_split			= 2
		no_gaps_when_only 	= false
}

# Lock screen
bind	= $MOD SHIFT, l, exec, loginctl lock-session

# Main Keybindings
bind = $MOD, T, exec, $term
bind = $MOD, Return, exec, $launcher
bind = $MOD SHIFT, Q, killactive
bind = $MOD SHIFT CTRL, E, exit

# Control screen brightness
binde = ,XF86MonBrightnessUp,   exec, $set-bright +10 && brightnessctl -s && $notify-low -a "Display Bright:" -h int:value:$($get-bright) " "
binde = ,XF86MonBrightnessDown, exec, $set-bright 10- && brightnessctl -s && $notify-low -a "Display Bright:" -h int:value:$($get-bright) " "

# MPD
bind = $MOD,XF86AudioPlay, exec, $music_status
bind = ,XF86AudioPlay, exec, $music_status
bind = ,XF86AudioPlay, exec, playerctl -p $player-list play-pause
binde = ,XF86AudioNext, exec, playerctl -p $player-list position 5+
binde = ,XF86AudioPrev, exec, playerctl -p $player-list position 5-

# Volume
binde = ,XF86AudioRaiseVolume, exec, $set-volume @DEFAULT_AUDIO_SINK@ 0.05+ && $notify-low -a "Audio Output:" -h int:value:$($get-sink-volume) " "
binde = ,XF86AudioLowerVolume, exec, $set-volume @DEFAULT_AUDIO_SINK@ 0.05- && $notify-low -a "Audio Output:" -h int:value:$($get-sink-volume) " "

# Microphone volume
binde = $MOD, XF86AudioRaiseVolume, exec, $set-volume @DEFAULT_AUDIO_SOURCE@ 0.05+ && $notify-low -a "Audio Input:" -h int:value:$($get-source-volume) " "
binde = $MOD, XF86AudioLowerVolume, exec, $set-volume @DEFAULT_AUDIO_SOURCE@ 0.05- && $notify-low -a "Audio Input:" -h int:value:$($get-source-volume) " "

# Togle Audio | Mic
bind = ,XF86AudioMute, exec, $toggle-mute @DEFAULT_AUDIO_SINK@ toggle && $notify-low -a "Audio Output:" "$($get-mute-status)"
bind = $MOD,XF86AudioMute, exec, $toggle-mute @DEFAULT_AUDIO_SOURCE@ toggle && $notify-low -a "Audio Input:" "$($get-mic-mute-status)"

# Change wallpaper and generate new colorscheme
bind = $MOD SHIFT, w, exec, $random_wallpaper &
bind = $MOD SHIFT, w, exec, $update_colorscheme &

# Screenshot
bind = $MOD, s, exec, grim - | wl-copy -t image/png && $notify-low -a "Screenshot:" "Fullscreen"
bind = $MOD SHIFT, s, exec, grim -g "$(slurp)" - | wl-copy -t image/png && $notify-low -a "Screenshot" "Partial"

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
bind = $MOD SHIFT, 1, movetoworkspace, 1
bind = $MOD SHIFT, 2, movetoworkspace, 2
bind = $MOD SHIFT, 3, movetoworkspace, 3
bind = $MOD SHIFT, 4, movetoworkspace, 4
bind = $MOD SHIFT, 5, movetoworkspace, 5
bind = $MOD SHIFT, 6, movetoworkspace, 6
bind = $MOD SHIFT, 7, movetoworkspace, 7
bind = $MOD SHIFT, 8, movetoworkspace, 8
bind = $MOD SHIFT, 9, movetoworkspace, 9
bind = $MOD SHIFT, 0, movetoworkspace, 10

# Scroll through existing workspaces with mainMod + scroll
bind = $MOD, mouse_down, workspace, e+1
bind = $MOD, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $MOD, mouse:272, movewindow
bindm = $MOD, mouse:273, resizewindow

debug {
	damage_tracking = 2
}

misc {
	force_default_wallpaper = 0
}
''
