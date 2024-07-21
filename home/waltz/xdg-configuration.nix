{ inputs, pkgs, ... }:
{
  # XDG desktop portal
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      #extraPortals = [ inputs.xdpw.packages.${pkgs.system}.xdg-desktop-portal-hyprland ];
      #configPackages = [ inputs.xdpw.packages.${pkgs.system}.xdg-desktop-portal-hyprland ];
      extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
      configPackages = [ pkgs.xdg-desktop-portal-wlr ];
      #extraPortals = [ (pkgs.xdg-desktop-portal-hyprland.overrideAttrs { version = "1.3.0"; }) ];
      #configPackages = [ (pkgs.xdg-desktop-portal-hyprland.overrideAttrs { version = "1.3.0"; }) ];
      #config = {
      #  common = { default = [ "hypr" ]; };
      #};
    };
  };
}
