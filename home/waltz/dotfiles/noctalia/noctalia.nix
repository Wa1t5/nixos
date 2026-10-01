{
  inputs,
  osConfig,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
    ./theme.nix
    ./bars.nix
    ./templates.nix
  ];

  programs.noctalia = {
    enable = osConfig.wm.umbriel.enable;
    settings = {
      nightlight = {
        enabled = true;
        force = true;
      };
      wallpaper = {
        directory = "/home/waltz/img/pics";
      };
    };
  };
}
