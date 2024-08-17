{ lib, config, ... }:
{
  programs.walker = {
    enable = lib.mkIf config.wm.enable true;
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
