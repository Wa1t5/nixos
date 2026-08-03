{ lib, osConfig, ... }:
{
  services.clipse = lib.mkIf osConfig.wm.enable {
    enable = true;
    imageDisplay = {
      type = "sixel";
      scaleX = 14;
      scaleY = 16;
    };
  };
}
