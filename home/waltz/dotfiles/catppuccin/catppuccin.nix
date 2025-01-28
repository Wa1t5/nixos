{ lib, config, ... }:
{
  catppuccin = lib.mkIf config.wm.enable {
    enable = true;
    accent = "mauve";
    flavor = "mocha";

    pointerCursor = {
      enable = true;
      accent = "mauve";
      flavor = "mocha";
    };
  };

  # GTK
  gtk.enable = true;
  gtk.catppuccin.enable = true;

  # Gnome
  gtk.catppuccin.gnomeShellTheme = true;

  # QT
  qt.enable = true;
  qt.style.catppuccin.enable = true;
  qt.platformTheme.name = "kvantum";
  qt.style.name = "kvantum";

  # Hyprland
  wayland.windowManager.hyprland.catppuccin.enable = lib.mkIf config.wm.enable true;
}
