{ lib, config, ... }:
{
  programs.gamemode = lib.mkIf config.gaming.enable {
    enable = true;
    enableRenice = true;
  };
}
