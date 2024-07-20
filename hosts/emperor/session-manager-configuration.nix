{ pkgs, ... }:
{
  # Enable swaylock to unlock session through PAM
  security.pam.services.swaylock = { };

  # Polkit
  security = {
    polkit = {
      enable = true;
    };
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      enable = true;
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };


  # Greetd + Tuigreet
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time -r --cmd 'Hyprland'";
      };
    };
  };

  # Avoid systemd spamming Tuigreet
  systemd.services.greetd = {
    serviceConfig.Type = "idle";
    #unitConfig.After = [ "dhcpcd.service" ];
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
