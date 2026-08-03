{ lib, osConfig, ... }:
{
  programs.vicinae = {
    enable = lib.mkIf (!osConfig.headless.enable) true;
    systemd = {
      enable = true;
      autoStart = true;
    };
  };
}
