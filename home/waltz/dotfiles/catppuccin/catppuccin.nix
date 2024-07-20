{ ... }:
{
  catppuccin = {
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

  # QT
  qt.enable = true;
  qt.style.catppuccin.enable = true;
  qt.platformTheme.name = "kvantum";
  qt.style.name = "kvantum";

  # Hyprland
  wayland.windowManager.hyprland.catppuccin.enable = true;
}
