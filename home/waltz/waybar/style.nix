''
@import "/home/waltz/.cache/wal/colors-waybar.css";
* 
{
    /* Fonts */
    font-family: Noto;
    font-size: 17px;
}

window#waybar {
    background-color: transparent;
    border-bottom: 0px solid rgba(100, 114, 125, 0.5);
    color: #ffffff;
    transition-property: background-color;
    transition-duration: .5s;
}

window#waybar.hidden {
    opacity: 0.2;
}

button {
    /* Use box-shadow instead of border so the text isn't offset */
    box-shadow: inset 0 -3px transparent;

    /* Avoid rounded borders under each button name */
    border: none;
    border-radius: 0;
}

/* Workspaces hover effect | below the workspace */
button:hover {
    color: inherit;
}

#workspaces button {
    padding: 0 5px;
    background-color: transparent;
    color: #ffffff;
}

/* Workspace hover effect | color  */
#workspaces button:hover {
    /*background: #828282;*/
	background: transparent;
}

/* Current active workspace */
#workspaces button.active {
    background-color: transparent;
    color: @color5;
}

/* Color when a workspace need focus */
#workspaces button.urgent {
    background-color: #eb4d4b;
}

/* ??? */
#mode {
    background-color: #64727D;
    border-bottom: 3px solid #ffffff;
}

/* Workspaces */
#workspaces {
    margin: 0 4px;
}

/* Clock  */
#clock {
  	margin-top: 8px;
  	margin-left: 8px;
  	padding-left: 10px;
    padding-right: 10px;
	  margin-bottom: 4px;
	  border-radius: 15px;
	  background-color: @color2;
}

/* Custom/bar: Calendar */
#custom-calendar {
  	margin-top: 8px;
  	margin-left: 8px;
  	padding-left: 10px;
    padding-right: 10px;
    margin-bottom: 4px;
    border-radius: 15px;
    background-color: @color5;
}

/* Battery */
#battery {
  	margin-top: 8px;
  	margin-left: 8px;
  	padding-left: 10px;
	  padding-right: 15px;
	  margin-bottom: 4px;
	  border-radius: 15px;
   	background-color: @color1;
}

/* Temperature */
#temperature {
    margin-top: 8px;
  	margin-left: 8px;
  	padding-left: 10px;
	  padding-right: 10px;
    margin-bottom: 3px;
    border-radius: 15px;
   	background-color: @color3;
}

/* Tray */
#tray {
    margin-top: 8px;
    margin-left: 8px;
  	padding-left: 10px;
	  padding-right: 10px;
	  margin-bottom: 4px;
	  border-radius: 15px;
    background-color: @color6;
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
