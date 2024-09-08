{ pkgs, lib, config, ... }:
{
  programs.rofi = {
    enable = lib.mkIf config.wm.enable true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.kitty}/bin/kitty";
  };
}
