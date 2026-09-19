{
  inputs,
  osConfig,
  lib,
  ...
}:
{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = osConfig.wm.umbriel.enable;
    settings = {

    };
  };
}
