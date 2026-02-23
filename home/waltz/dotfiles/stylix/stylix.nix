{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
{
  stylix = lib.mkIf config.themes.stylix.enable {
    enable = true;
    image = null;
    polarity = "dark";
    autoEnable = true;

    opacity.desktop = 0.0;
    opacity.popups = 0.8;
    opacity.terminal = 0.7;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-dark.yaml";

    cursor = {
      package = pkgs.catppuccin-cursors.mochaMauve;
      name = "Catppuccin-Mocha-Mauve-Cursors";
      size = 16;
    };

    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      serif = {
        package = pkgs.source-serif-pro;
        name = "Souce Serif Pro";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
