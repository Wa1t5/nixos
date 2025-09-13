{ lib, config, pkgs, inputs, ... }:
{
  stylix = lib.mkIf config.themes.stylix.enable {
    enable = true;
    image = null;
    polarity = "dark";
    autoEnable = true;

    opacity.desktop = 0.0;
    opacity.popups = 0.8;
    opacity.terminal = 0.7;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-dark.yaml";

    cursor = {
      package = pkgs.catppuccin-cursors.mochaMauve;
      name = "Catppuccin-Mocha-Mauve-Cursors";
      size = 16;
    };

    fonts = {
      monospace = {
        package = pkgs.noto-fonts;
        name = "Noto Sans Mono";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      emoji = {
        package = pkgs.noto-fonts;
        name = "Noto Emoji";
      };
    };
  };
}
