{ pkgs, inputs, ... }:
{
  programs.hyprlock = {
    enable = true;
    package = inputs.hyprlock.packages.${pkgs.system}.hyprlock;
    extraConfig = import ./config.nix;
  };
}
