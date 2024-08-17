{ inputs, pkgs, lib, config, ... }:
{
  # XDG desktop portal
  xdg = lib.mkIf config.wm.enable {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = lib.mkIf config.wm.hyprland.enable [ pkgs.xdg-desktop-portal-hyprland ];
      configPackages = lib.mkIf config.wm.hyprland.enable [ pkgs.xdg-desktop-portal-hyprland ];
    };
  };
}
