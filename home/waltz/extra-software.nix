{ pkgs, inputs, lib, config, ... }:

{
  imports = [
    inputs.aagl.nixosModules.default
    ./dotfiles/steam/steam.nix
    ./dotfiles/aagl/aagl.nix
    ./config.nix # Current file is impoted by uplevel options.nix thus needing to import config manually
  ];

  # Dconfig
  programs.dconf.enable = true;

  # Enable hyprland 2-nd time
  programs.hyprland = lib.mkIf config.wm.hyprland.enable { enable = true; };

  # Gnome desktop
  services.xserver.enable = lib.mkIf config.de.gnome.enable true;
  services.xserver.displayManager.gdm.enable =
    lib.mkIf config.de.gnome.enable true;
  services.xserver.desktopManager.gnome.enable =
    lib.mkIf config.de.gnome.enable true;
  environment.gnome.excludePackages =
    (with pkgs; [ gnome-tour gnome-maps totem ]);

  # Plasma desktop
  services.displayManager.sddm.enable = lib.mkIf config.de.plasma.enable true;
  services.displayManager.sddm.wayland.enable =
    lib.mkIf config.de.plasma.enable true;
  services.desktopManager.plasma6.enable =
    lib.mkIf config.de.plasma.enable true;

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
  services.greetd = lib.mkIf config.wm.enable {
    enable = true;
    settings = {
      initial_session = {
        command = "Hyprland";
        user = "waltz";
      };
      default_session = {
        #command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time -r --cmd 'Hyprland'";
        command = "Hyprland";
        user = "waltz";
      };
    };
  };

  # Extra packages

}
