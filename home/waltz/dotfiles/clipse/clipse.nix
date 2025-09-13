{ lib, config, ... }:
{
  services.clipse = lib.mkIf config.wm.enable {
    enable = true;
    imageDisplay = {
      type = "sixel";
      scaleX = 14;
      scaleY = 16;
    };
  };
}
