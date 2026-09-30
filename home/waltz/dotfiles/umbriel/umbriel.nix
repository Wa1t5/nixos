{
  osConfig,
  inputs,
  ...
}:
{
  imports = [
    inputs.umbriel.homeModules.default
    ./outputs.nix
    ./inputs.nix
    ./keybinds.nix
    ./appearance.nix
    ./window_rules.nix
    ./layer_rules.nix
  ];

  programs.umbriel = {
    enable = osConfig.wm.umbriel.enable;

    settings = {
      environment = {
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        SDL_VIDEODRIVER = "wayland";
      };

      general = {
        autostart = [ "noctalia" ];
        xwayland = true;
      };

      layout = {
        mode = "master";
      };

    };
  };
}
