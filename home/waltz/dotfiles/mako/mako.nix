{ lib, config, ... }: {
  # reenable this after catppuccin-nix updates 
  catppuccin.mako.enable = false;
  services.mako = lib.mkIf config.wm.enable {
    enable = true;
    settings = {
      anchor = "top-right";
      layer = "overlay";
      backgroundColor = lib.mkForce "#00000080";
      defaultTimeout = 2400;
      borderSize = 3;
    };
  };
}
