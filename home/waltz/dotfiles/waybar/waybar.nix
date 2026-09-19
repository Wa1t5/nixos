{ lib, osConfig, ... }:
{
  programs.waybar = lib.mkIf osConfig.wm.enable {
    enable = true;
    style = import ./style.nix;
    settings = import ./config.nix;
    systemd = {
      enable = true;
      targets = [ "hyprland-session.target" ];
    };
  };
}
