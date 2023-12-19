''
@import "/home/waltz/.cache/wal/colors-waybar.css";
* 
{
    /* Fonts */
    font-family: Noto;
    font-size: 17px;
}

window#waybar {
    background-color: #111212;
    border-bottom: 0px solid rgba(100, 114, 125, 0.5);
    color: #ffffff;
    transition-property: background-color;
    transition-duration: .5s;
}

window#waybar.hidden {
    opacity: 0.2;
}

/* Workspaces bar */
#workspaces {
    border-radius: 15px;
    margin-bottom: 4px;
    margin-top: 4px;
    background-color: @color4;
}

#workspaces button {
    padding: 0 2px;
    /*border-radius: 15px;*/
    background-color: transparent;
    color: #ffffff;
}

/* Current active workspace */
#workspaces button.active {
    background-color: transparent;
    color: @color12;
}

/* Color when a workspace need focus */
#workspaces button.urgent {
    background-color: #eb4d4b;
}


/* Workspace hover effect | color  */
button:hover {
    background-color: transparent;
    color: transparent;
}

/* Clock  */
#clock {
  	margin-top: 4px;
  	margin-left: 8px;
  	padding-left: 10px;
    padding-right: 10px;
	  margin-bottom: 4px;
	  border-radius: 15px;
	  background-color: @color13;
}

/* Battery */
#battery {
  	margin-top: 4px;
  	margin-left: 8px;
  	padding-left: 10px;
	  padding-right: 15px;
	  margin-bottom: 4px;
	  border-radius: 15px;
   	background-color: @color1;
}

/* Temperature */
#temperature {
    margin-top: 4px;
  	margin-left: 8px;
  	padding-left: 10px;
	  padding-right: 10px;
    margin-bottom: 4px;
    border-radius: 15px;
   	background-color: @color14;
}

/* Tray */
#tray {
    margin-top: 4px;
    margin-left: 8px;
  	padding-left: 10px;
	  padding-right: 10px;
	  margin-bottom: 4px;
	  border-radius: 15px;
    background-color: @color6;
}

/* MPD */
#mpd {
    margin-top: 4px;
    margin-left: 8px;
  	padding-left: 10px;
	  padding-right: 10px;
	  margin-bottom: 4px;
	  border-radius: 15px;
    background-color: @color7;
}

/* MPRIS */
#mpris {
    margin-top: 4px;
    margin-left: 8px;
  	padding-left: 10px;
	  padding-right: 10px;
	  margin-bottom: 4px;
	  border-radius: 15px;
    background-color: @color10;
}
/* Cava */
#cava {
    margin-top: 4px;
    margin-left: 8px;
  	padding-left: 10px;
	  padding-right: 10px;
	  margin-bottom: 4px;
	  border-radius: 15px;
    background-color: @color11;
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
