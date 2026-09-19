{
  osConfig,
  inputs,
  lib,
  ...
}:
{
  imports = [ inputs.umbriel.homeModules.default ];

  programs.umbriel = {
    enable = osConfig.wm.umbriel.enable;

    settings = {
      output."LG Electronics LG ULTRAGEAR 0x0005B599" = {
        mode = "1920x1080@120";
        position = [
          0
          0
        ];
        vrr = "disabled";
        direct_scanout = true;
        tearing = true;
        workspaces = 10;
      };

      general = {
        autostart = [ "noctalia" ];
      };
      keybinds = {
        "Mod+T" = "spawn:kitty";
        "Mod+Space" = "spawn:noctalia msg panel-toggle launcher";
        "Mod+Q" = "spawn:window-close";

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
      };
    };
  };
}
