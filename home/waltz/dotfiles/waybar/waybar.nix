{ lib, config, ... }:
{
  programs.waybar = {
    enable = lib.mkIf config.wm.enable true;
    style = import ./style.nix;
    settings = import ./config.nix;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
  };
}
