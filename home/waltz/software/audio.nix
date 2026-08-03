{ pkgs, lib, osConfig, ... }:
{
  config = lib.mkIf (!osConfig.headless.enable) {
    home.packages = with pkgs; [
      # Manage audio
      pavucontrol
    ];
  };
}
