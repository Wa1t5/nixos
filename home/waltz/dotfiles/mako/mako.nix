{ lib, config, ... }: {
  # reenable this after catppuccin-nix updates 
  catppuccin.mako.enable = false;
  services.mako = lib.mkIf config.wm.enable {
    enable = true;
    settings = {
      anchor = "top-right";
      layer = "overlay";
      background-color = lib.mkForce "#00000080";
      default-timeout = 2400;
      border-size = 3;
    };
  };
}
