{ pkgs, lib, config, ... }:
{
  programs.rofi = {
    enable = lib.mkIf config.wm.enable true;
    terminal = "${pkgs.kitty}/bin/kitty";
  };
}
