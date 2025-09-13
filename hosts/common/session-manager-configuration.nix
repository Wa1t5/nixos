{ ... }:
{
  # Enable swaylock to unlock session through PAM
  security.pam.services.hyprlock = { };

  # Polkit
  security = {
    polkit = {
      enable = true;
    };
  };

  # Avoid systemd spamming Tuigreet
  systemd.services.greetd = {
    unitConfig.After = [ "dhcpcd.service" ];
  };

  # LoginD config 
  services.logind.settings.Login = {
    HandlePowerKey = "hybrid-sleep";
    HandleRebootKey = "hybrid-sleep";
    HandleSuspendKey = "hybrid-sleep";
    HandleHibernateKey = "hybrid-sleep";
    HandleLidSwitch = "hybrid-sleep";
    HandleLidSwitchExternalPower = "hybrid-sleep";

    HandlePowerKeyLongPress = "hybrid-sleep";
    HandleRebootKeyLongPress = "hybrid-sleep";
    HandleSuspendKeyLongPress = "hybrid-sleep";
  };
}
