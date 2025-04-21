{ lib, config, ... }: {
  services.mako = lib.mkIf config.wm.enable {
    enable = true;
    anchor = "top-right";
    layer = "overlay";
    backgroundColor = lib.mkForce "#00000080";
    defaultTimeout = 2400;
    borderSize = 3;
  };
}
