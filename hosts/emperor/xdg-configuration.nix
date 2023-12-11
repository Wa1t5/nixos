{ pkgs, ... }:
{
  # XDG desktop portal
  xdg = {
    portal.enable = true; 
    portal.xdgOpenUsePortal = true;
    portal.extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };
}
