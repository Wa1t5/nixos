{ lib, config, ... }:
{
  programs.hyprlock = lib.mkIf config.wm.hyprland.enable {
    enable = true;
    #package = inputs.hyprlock.packages.${pkgs.system}.hyprlock;
    extraConfig = import ./config.nix;
  };
}
