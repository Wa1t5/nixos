{ pkgs, ... }:
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
  services.logind = {
    powerKey = "hybrid-sleep";
    rebootKey = "hybrid-sleep";
    suspendKey = "hybrid-sleep";
    hibernateKey = "hybrid-sleep";
    lidSwitch = "hybrid-sleep";
    lidSwitchExternalPower = "hybrid-sleep";

    powerKeyLongPress = "hybrid-sleep";
    rebootKeyLongPress = "hybrid-sleep";
    suspendKeyLongPress = "hybrid-sleep";
  };
}
