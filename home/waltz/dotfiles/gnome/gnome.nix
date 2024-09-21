{ lib, config, pkgs, ... }:
{
  # Gnome
  programs.gnome-shell = {
    enable = lib.mkIf config.de.gnome.enable true;
    extensions = [
      { package = pkgs.gnomeExtensions.appindicator; }
      { package = pkgs.gnomeExtensions.media-controls; }
      { package = pkgs.gnomeExtensions.vitals; }
      { package = pkgs.gnomeExtensions.blur-my-shell; }
      { package = pkgs.gnomeExtensions.kimpanel; }
      { package = pkgs.gnomeExtensions.hibernate-status-button; }
    ];
  };

  # Dconf
  dconf.enable = true;
  dconf.settings = {
    # Extenions
    "org/gnome" = {
      enabled-extensions = [
        pkgs.gnomeExtensions.user-themes.extensionUuid
        pkgs.gnomeExtensions.appindicator.extensionUuid
        pkgs.gnomeExtensions.vitals.extensionUuid
        pkgs.gnomeExtensions.blur-my-shell.extensionUuid
        pkgs.gnomeExtensions.kimpanel.extensionUuid
        pkgs.gnomeExtensions.hibernate-status-button.extensionUuid
      ];
      disabled-extensions = [
        pkgs.gnomeExtensions.system-monitor.extensionUuid
        pkgs.gnomeExtensions.appindicator.extensionUuid
      ];
    };

    # Extensions: Settings
    "org/gnome/shell/extensions/mediacontrols" = { extension-position = "Left"; extension-index = 1; };
    "org/gnome/shell/extensions/blur-my-shell/applications" = { blur = true; };

    # DE
    "org/gnome/shell/extensions/vitals" = { hot-sensors = [ "_memory_usage_" "__temperature_avg__" "_processor_usage_" ]; };
    "org/gnome/desktop/peripherals/touchpad" = { two-finger-scrolling-enabled = true; };
    "org/gnome/desktop/interface" = { color-scheme = "prefer-dark"; };
    "org/gnome/desktop/interface" = { enable-hot-corners = true; };
    "org/gnome/mutter" = {
      edge-tiling = true;
      dynamic-workspaces = true;
    };
  };
}
