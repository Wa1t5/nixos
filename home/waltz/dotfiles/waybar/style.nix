''

* 
{
    /* Fonts */
    font-family: Noto;
    font-size: 17px;
}

window#waybar {
    border-bottom: 0px solid rgba(100, 114, 125, 0.5);
}

window#waybar.hidden {
    opacity: 0.2;
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

/* Current active workspace */
#workspaces button.active {
}

/* Color when a workspace need focus */
#workspaces button.urgent {
}


/* Workspace hover effect | color  */
button:hover {
}

#clock,
#battery,
#temperature,
#tray,
#mpd,
#mpris,
#cava,
#cpu, 
#pulseaudio,
#backlight {
  margin-top: 4px;
  margin-left: 4px;
  padding-left: 10px;
  padding-right: 10px;
  margin-bottom: 4px;
  border-radius: 15px;
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
