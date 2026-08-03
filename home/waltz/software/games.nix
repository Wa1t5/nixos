{ pkgs, lib, osConfig, ... }:
{
  config = lib.mkIf (!osConfig.headless.enable) {
    home.packages = with pkgs; [
      osu-lazer-bin
      prismlauncher
      lsfg-vk
      lsfg-vk-ui
    ];
  };
}
