{ inputs, pkgs, ... }:
{
  # XDG desktop portal
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [ inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland ];
      configPackages = [ inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland ];
      #extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
      #configPackages = [ pkgs.xdg-desktop-portal-hyprland ];
      #config = {
      #  common = { default = [ "hypr" ]; };
      #};
    };
  };
}
