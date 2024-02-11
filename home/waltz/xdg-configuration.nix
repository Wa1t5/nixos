{ inputs, pkgs, ... }:
{
  # XDG desktop portal
  xdg = {
    portal = {
      enable = true; 
      xdgOpenUsePortal = true;
      extraPortals = [ inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland ];
      config = {
        common = { default = [ "hypr" ]; };
      };
    };
  };
}
