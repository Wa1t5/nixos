{ lib, inputs, osConfig, ... }: {
  imports = [ inputs.catppuccin.homeModules.catppuccin ];
  catppuccin = lib.mkIf osConfig.themes.catppuccin.enable {
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

    #gtk.gnomeShellTheme = true;
    #gtk.enable = true;
  };

  #gtk.enable = lib.mkIf osConfig.themes.catppuccin.enable true;
  #gtk.catppuccin.enable = lib.mkIf osConfig.themes.catppuccin.enable true;
}
