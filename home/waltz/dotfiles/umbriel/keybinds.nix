{ ... }:
{
  programs.umbriel.settings = {
    keybinds = {
      # Spawn terminal
      "Mod+T" = "spawn:kitty";

      # Launcher
      "Mod+Space" = "spawn:noctalia msg panel-toggle launcher";

      # Close window
      "Mod+Q" = "window-close";

      # Switch workspaces
      "Mod+1" = "workspace-switch:1";
      "Mod+2" = "workspace-switch:2";
      "Mod+3" = "workspace-switch:3";
      "Mod+4" = "workspace-switch:4";
      "Mod+5" = "workspace-switch:5";
      "Mod+6" = "workspace-switch:6";
      "Mod+7" = "workspace-switch:7";
      "Mod+8" = "workspace-switch:8";
      "Mod+9" = "workspace-switch:9";
      "Mod+0" = "workspace-switch:10";

      # Window focusing
      "Mod+Up" = "window-focus-up";
      "Mod+Down" = "window-focus-down";
      "Mod+Left" = "window-focus-next";
      "Mod+Right" = "window-focus-right";

      # Window switcher
      "Alt+Tab" = "spawn:noctalia msg window-switcher";

      # Workspace viewer
      "Mod+Tab" = "overview-toggle";

      # Control volume
      "XF86AudioRaiseVolume" = "spawn:noctalia msg volume-up";
      "XF86AudioLowerVolume" = "spawn:noctalia msg volume-down";
      "XF86AudioMute" = "spawn:noctalia msg volume-mute";

      # Toggle display
      "Mod+Shift+D" =
        "spawn:umbriel msg output-toggle:$(umbriel outputs | grep -e 'HDMI' -e 'eDP' | awk  -F ' ' '{print $1}' | noctalia dmenu)";

      # Toggle clipboard
      "Mod+V" = "spawn:noctalia msg panel-toggle clipboard";

      # Toggle wallpaper panel
      "Mod+W" = "spawn:noctalia msg panel-toggle wallpaper";

      # Fullscreen screenshot
      "Mod+S" = "spawn:noctalia msg screenshot-fullscreen all";
      "Mod+Shift+S" = "spawn:noctalia msg screenshot-region";
    };
  };
}
