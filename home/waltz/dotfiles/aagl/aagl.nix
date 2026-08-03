{ lib, config, ... }:
{
  # An Anime Game Launcher
  #programs.anime-game-launcher.enable = lib.mkIf osConfig.gaming.enable true; # Adds launcher and /etc/hosts rules
  #programs.anime-games-launcher.enable = lib.mkIf osConfig.gaming.enable true;
  #programs.anime-borb-launcher.enable = lib.mkIf osConfig.gaming.enable true;
  programs.honkers-railway-launcher.enable = lib.mkIf config.gaming.enable true;
  #programs.honkers-launcher.enable = lib.mkIf osConfig.gaming.enable true;
  #programs.wavey-launcher.enable = lib.mkIf osConfig.gaming.enable true;
  programs.sleepy-launcher.enable = lib.mkIf config.gaming.enable true;
}
