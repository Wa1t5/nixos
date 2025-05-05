{ lib, config, inputs, pkgs, ... }:
{
  imports = [
    inputs.walker.homeManagerModules.default
  ];

  programs.walker = lib.mkIf config.wm.enable {
    enable = false;
    package = pkgs.walker;
    runAsService = true;


    config.builtins = {
      clipboard.prefix = "cl";
      clipboard.switcher_only = false;
      emojis.prefix = "m";
      emojis.switcher_only = false;
      websearch.prefix = "w";
      websearch.switcher_only = false;
      calc.prefix = "=";
      calc.switcher_only = false;
      finder.prefix = "f";
      finder.switcher_only = false;
    };
  };
}
