{ inputs, pkgs, lib, config, ... }:
{
  # XDG desktop portal
  xdg = lib.mkIf config.wm.enable {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = lib.mkIf config.wm.hyprland.enable [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
      configPackages = lib.mkIf config.wm.hyprland.enable [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
    };
    mimeApps.enable = true;
    mimeApps.defaultApplications = {
      "application/pdf" = "brave.desktop";
      "image/png" = "imv.desktop";
      "image/jpg" = "imv.desktop";
      "image" = "imv.desktop";
      "text" = [
        "vscode.desktop"
        "nvim.desktop"
      ];
    };
  };
}
