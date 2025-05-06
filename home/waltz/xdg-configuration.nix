{
  pkgs,
  lib,
  config,
  ...
}:
{
  # XDG desktop portal
  xdg = lib.mkIf config.wm.enable {
    portal.enable = lib.mkForce true;
    mimeApps.enable = true;
  };
}
