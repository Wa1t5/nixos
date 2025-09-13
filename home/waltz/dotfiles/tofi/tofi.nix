{ config, lib, ... }:
{
  catppuccin.tofi.enable = false;
  programs.tofi = lib.mkIf config.wm.enable {
    enable = true;
    settings = {
      terminal = "foot";
      drun-launch = true;
      background-color = lib.mkForce "#00000000";
      border-color = lib.mkForce "#00000000";
      border-size = 0;
      outline-width = 0;
      corner-radius = 0;
      height = "100%";
      width = "100%";
      font-size = lib.mkForce 17;
    };
  };
}
