{ lib, config, ... }: {
  catppuccin = lib.mkIf config.themes.catppuccin.enable {
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
    hyprlock.useDefaultConfig = false;

    gtk.gnomeShellTheme = true;
    gtk.enable = true;
  };

  gtk.enable = lib.mkIf config.themes.catppuccin.enable true;
  gtk.catppuccin.enable = lib.mkIf config.themes.catppuccin.enable true;
}
