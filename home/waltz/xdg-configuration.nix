{ pkgs, lib, config, ... }:
{
  # XDG desktop portal
  xdg = lib.mkIf config.wm.enable {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = lib.mkIf config.wm.hyprland.enable [ pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-gtk ];
      configPackages = lib.mkIf config.wm.hyprland.enable [ pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-gtk ];
    };
    mimeApps.enable = true;
  };
}
