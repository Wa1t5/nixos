{ lib, osConfig, ... }:
{
  programs.waybar = lib.mkIf osConfig.wm.enable {
    enable = true;
    style = import ./style.nix;
    settings = import ./osConfig.nix;
    systemd = {
      enable = true;
      targets = [ "hyprland-session.target" ];
    };
  };
}
