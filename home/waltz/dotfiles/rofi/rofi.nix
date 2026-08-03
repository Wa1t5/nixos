{ pkgs, lib, osConfig, ... }:
{
  programs.rofi = {
    enable = lib.mkIf osConfig.wm.enable true;
    terminal = "${pkgs.kitty}/bin/kitty";
  };
}
