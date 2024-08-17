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
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=hybrid-sleep
    HandleSuspendKey=hybrid-sleep
    HandleHibernateKey=hybrid-sleep

    # Suspend when lid is closed
    HandleLidSwitch=hybrid-sleep

    # Hibernate delay
    HibernateDelaySec=600
  '';

}
