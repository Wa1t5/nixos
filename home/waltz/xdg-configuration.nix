{ inputs, pkgs, ... }:
{
  # XDG desktop portal
  xdg = {
    portal = {
      enable = true; 
      xdgOpenUsePortal = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
      configPackages = [ pkgs.xdg-desktop-portal-hyprland ];
      #extraPortals = [ inputs.xdpw.packages.${pkgs.system}.xdg-desktop-portal-hyprland ];
      #configPackages = [ inputs.xdpw.packages.${pkgs.system}.xdg-desktop-portal-hyprland ];
      #config = {
      #  common = { default = [ "hypr" ]; };
      #};
    };
  };
}
