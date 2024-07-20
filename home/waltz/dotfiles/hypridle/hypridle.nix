{ services, pkgs, inputs, ... }:
let
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
  hyprlock = inputs.hyprlock.packages.${pkgs.system}.hyprlock;
  hypridle = inputs.hypridle.packages.${pkgs.system}.hypridle;
in
{
  services.hypridle = {
    enable = true;
    package = inputs.hypridle.packages.${pkgs.system}.hypridle;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || ${hyprlock}/bin/hyprlock"; # avoid starting multiple hyprlock instances.
        before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
        after_sleep_cmd = "${hyprland}/bin/hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
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
