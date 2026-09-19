{
  lib,
  osConfig,
  pkgs,
  ...
}:
{
  # XDG desktop portal
  xdg = lib.mkIf osConfig.wm.enable {
    portal = {
      enable = lib.mkForce true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
    mimeApps.enable = true;
  };
}
