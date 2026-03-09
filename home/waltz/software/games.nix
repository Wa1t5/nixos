{ pkgs, ... }:
{

  home.packages = with pkgs; [
    osu-lazer-bin
    prismlauncher
    lsfg-vk
    lsfg-vk-ui
  ];
}
