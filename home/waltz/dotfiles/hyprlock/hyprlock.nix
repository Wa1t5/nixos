{ lib, osConfig, ... }:
{
  programs.hyprlock = lib.mkIf osConfig.wm.hyprland.enable {
    enable = true;
    #package = inputs.hyprlock.packages.${pkgs.system}.hyprlock;
    extraConfig = import ./config.nix;
  };
}
