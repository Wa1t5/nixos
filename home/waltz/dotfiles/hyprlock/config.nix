''
    source=hyprland.conf # load colors from colorscheme

    image {
      monitor =
      path = /home/waltz/.config/hypr/pfp
      size = 150
      rounding = 100
      border_size = 1
      border_color = $accent
      rotate = 0
      reload_time = -1
      reload_cmd =

      position = 0, 100
      halign = center
      valign = center
    }


    #label {
    #  monitor =
    #  text = Welcome, $USER
    #  text_align = center
    #  position = 0, 0
    #  color = $accent
    #  halign = center
    #  valign = center
    }


    label {
      monitor =
      text = $TIME
      text_align = center
      position = 0, 210
      color = $accent
      halign = center
      valign = center
    }


    shape {
      monitor =
      size = 80, 30
      color = rgba(17, 17, 17, 1.0)
      rounding = -1
      border_size = 3
      border_color = $accent
      rotate = 0
      xray = false
      position = 0, 210
      halign = center
      valign = center
  }


    input-field {
      monitor =
      font_color = $accent
      size = 200, 30
      outline_thickness = 3
      inner_color = rgba(17, 17, 17, 1.0)
      dots_size = 0.33
      dots_spacing = 0.15
      dots_center = true
      dots_rounding = -1
      outer_color = $accent
      inner_color = $surface0
      font_color = $text
      fade_on_empty = false
      fade_timeout = 1000
      hide_input = false
      rounding = -1
      check_color = $accent
      fail_color = $red
      fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i>
      fail_transition = 300
      capslock_color = $yellow
      numlock_color = -1
      bothlock_color = -1
      invert_numlock = false
      swap_font_color = false
      position = 0, -50
      halign = center
      valign = center
    }


    background {
      monitor =
      path = screenshot
      blur_passes = 1
      blur_size = 4
      noise = 0.0117
      contrast = 0.8916
      brightness = 0.8172
      vibrancy = 0.1696
      vibrancy_darkness = 0.0
  }
''
