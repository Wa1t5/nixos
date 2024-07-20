{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.kitty}/bin/kitty";
    plugins = with pkgs; [
      rofimoji
      rofi-calc
      rofi-obsidian
      rofi-power-menu
    ];
    extraConfig =
      {
        combi-modes = "obsidian,emoji";
        modes = "obsidian:${pkgs.rofi-obsidian}/bin/rofi-obsidian,emoji:${pkgs.rofimoji}/bin/rofimoji";
      };
  };
}
