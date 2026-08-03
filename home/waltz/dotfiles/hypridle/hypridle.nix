{ services, pkgs, inputs, lib, osConfig, ... }:
{
  services.hypridle = lib.mkIf osConfig.wm.hyprland.enable {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock"; # avoid starting multiple hyprlock instances.
        before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
        after_sleep_cmd = "loginctl lock-session && ${pkgs.hyprland}/bin/hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
      };

      listener = [
        {
          timeout = 300; # 5min
          on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
        }
        {
          timeout = 330; # 5.5min
          on-timeout = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off"; # screen off when timeout has passed
          on-resume = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on"; # screen on when activity is detected after timeout has fired.
        }
        {
          timeout = 1800; # 30min
          on-timeout = "systemctl suspend"; # suspend pc
        }
      ];
    };
  };
}
