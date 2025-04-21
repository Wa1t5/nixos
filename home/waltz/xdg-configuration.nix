{
  pkgs,
  lib,
  config,
  ...
}:
{
  # XDG desktop portal
  xdg = lib.mkIf config.wm.enable {
    mimeApps.enable = true;
  };
}
