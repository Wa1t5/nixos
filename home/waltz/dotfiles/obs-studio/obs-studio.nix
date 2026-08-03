{ pkgs, lib, osConfig, ... }:
{
  programs.obs-studio = {
    enable = lib.mkIf (!osConfig.headless.enable) true;
    plugins = with pkgs; [
      obs-studio-plugins.obs-pipewire-audio-capture
      obs-studio-plugins.obs-vkcapture
    ];
  };
}
