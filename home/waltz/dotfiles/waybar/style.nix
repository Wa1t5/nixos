''

  *
  {
      /* Fonts */
      font-family: "Noto Sans Mono CJK JP";
      font-size: 17px;
  }

  window#waybar {
      /* background: @base; */
      background: rgba(0, 0, 0, 0.5);
      border-bottom: 0px solid rgba(100, 114, 125, 0.5);
  }

  window#waybar.hidden {
      /*opacity: 0.2;*/
  }

  /* Workspaces bar */
  #workspaces {
      border-radius: 15px;
      margin-bottom: 4px;
      margin-top: 4px;
  }

  #workspaces button {
      padding: 0 2px;
  }

  #workspaces button.active {
    color: @mauve;
  }


  button:hover {
    box-shadow: none; /* Remove predefined box-shadow */
    text-shadow: none; /* Remove predefined text-shadow */
    background: none; /* Remove predefined background color (white) */
    transition: none; /* Disable predefined animations */
    border: none; /* Disable borders */
  }

  #workspaces,
  #clock,
  #battery,
  #temperature,
  #tray,
  #mpd,
  #mpris,
  #cava,
  #cpu,
  #pulseaudio,
  #backlight,
  #network
  #idle_inhibitor {
    margin-top: 4px;
    margin-left: 4px;
    padding-left: 10px;
    padding-right: 10px;
    margin-bottom: 4px;
    border-radius: 15px;
    color: @text;
  }

  /* If workspaces is the leftmost module, omit left margin */
  .modules-left > widget:first-child > #workspaces {
      margin-left: 0;
  }

  /* If workspaces is the rightmost module, omit right margin */
  .modules-right > widget:last-child > #workspaces {
      margin-right: 0;
  }
''
