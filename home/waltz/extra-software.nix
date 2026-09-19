{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:

{
  imports = [
    inputs.aagl.nixosModules.default
    inputs.umbriel.nixosModules.default
    ./dotfiles/noctalia-greeter/noctalia-greeter.nix
    ./dotfiles/steam/steam.nix
    ./dotfiles/aagl/aagl.nix
    ./config.nix # Current file is imported by uplevel options.nix thus needing to import config manually
  ];

  # Gnome keyring
  services.gnome.gnome-keyring = lib.mkIf config.wm.enable {
    enable = true;
  };

  programs.seahorse = lib.mkIf config.wm.enable {
    enable = true;
  };

  # Dconfig
  programs.dconf.enable = true;

  # Enable hyprland 2-nd time
  programs.hyprland = {
    enable = config.wm.hyprland.enable;
  };

  # Same for umbriel
  programs.umbriel = {
    enable = config.wm.umbriel.enable;
  };

  # Gnome desktop
  services.xserver.enable = lib.mkIf config.de.gnome.enable true;
  services.xserver.displayManager.gdm.enable = lib.mkIf config.de.gnome.enable true;
  services.xserver.desktopManager.gnome.enable = lib.mkIf config.de.gnome.enable true;
  environment.gnome.excludePackages = (
    with pkgs;
    [
      gnome-tour
      gnome-maps
      totem
    ]
  );

  # Plasma desktop
  services.displayManager.sddm.enable = lib.mkIf config.de.plasma.enable true;
  services.displayManager.sddm.wayland.enable = lib.mkIf config.de.plasma.enable true;
  services.desktopManager.plasma6.enable = lib.mkIf config.de.plasma.enable true;

  # GreetD and gnome polkit
  #systemd.user.services.polkit-gnome-authentication-agent-1 = lib.mkIf config.wm.enable {
  #  enable = true;
  #  description = "polkit-gnome-authentication-agent-1";
  #  wantedBy = [ "graphical-session.target" ];
  #  wants = [ "graphical-session.target" ];
  #  after = [ "graphical-session.target" ];
  #  serviceConfig = {
  #    Type = "simple";
  #    ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  #    Restart = "on-failure";
  #    RestartSec = 1;
  #    TimeoutStopSec = 10;
  #  };
  #};

  systemd.user.services.hyprpolkitagent = lib.mkIf config.wm.hyprland.enable {
    enable = true;
    description = "hyprpolkitagent";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  systemd.user.services.hyprsunset = lib.mkIf config.wm.hyprland.enable {
    enable = true;
    description = "hyprsunset";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.hyprsunset}/bin/hyprsunset";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  # Greetd + Tuigreet
  #services.greetd = lib.mkIf config.wm.enable {
  #  enable = true;
  #  settings = {
  #    initial_session = {
  #      command = "umbriel";
  #      user = "waltz";
  #    };
  #    default_session = {
  #command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time -r --cmd 'Hyprland'";
  #      command = "umbriel";
  #      user = "waltz";
  #    };
  #  };
  #};

  # Extra packages

}
