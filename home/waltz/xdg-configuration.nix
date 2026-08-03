{ pkgs
, lib
, osConfig
, ...
}:
{
  # XDG desktop portal
  xdg = lib.mkIf osConfig.wm.enable {
    portal.enable = lib.mkForce true;
    mimeApps.enable = true;
  };
}
