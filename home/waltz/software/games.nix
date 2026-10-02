{
  pkgs,
  lib,
  osConfig,
  ...
}:
{
  config = lib.mkIf (!osConfig.headless.enable) {
    home.packages = with pkgs; [
      prismlauncher
      lsfg-vk
      lsfg-vk-ui
    ];
  };
}
