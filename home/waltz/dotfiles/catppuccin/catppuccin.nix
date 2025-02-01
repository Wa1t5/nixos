{ lib, config, ... }:
{
  catppuccin = lib.mkIf config.wm.enable {
    enable = true;
    accent = "mauve";
    flavor = "mocha";

    cursors = {
      enable = true;
      accent = "mauve";
      flavor = "mocha";
    };

    kvantum.enable = true;

    hyprland.enable = true;

    gtk.gnomeShellTheme = true;
    gtk.enable = true;
  };

  gtk.enable = true;
  gtk.catppuccin.enable = true;
}
