{ pkgs, inputs, lib, config, ... }:
{
  imports = [
    inputs.aagl.nixosModules.default
    inputs.nixos-cosmic.nixosModules.default
    ./dotfiles/steam/steam.nix
    ./dotfiles/aagl/aagl.nix
    ./config.nix # Current file is impoted by uplevel options.nix thus needing to import config manually
  ];

  # Dconfig
  programs.dconf.enable = true;

  # Enable hyprland 2-nd time
  programs.hyprland = lib.mkIf config.wm.hyprland.enable {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-wlr;
    #portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  # Cosmic desktop
  services.desktopManager.cosmic.enable = lib.mkIf config.de.cosmic.enable true;
  services.displayManager.cosmic-greeter.enable = lib.mkIf config.de.cosmic.enable true;
  services.power-profiles-daemon.enable = lib.mkForce false;

  # Cosmic DE | TODO: Remove when they fix the bug about no keyboard layouts being shown in settings
  systemd.tmpfiles.rules = [
    "L /usr/share/X11/xkb/rules/base.xml - - - - ${pkgs.xkeyboard_config}/share/X11/xkb/rules/base.xml"
  ];


  # Gnome desktop
  services.xserver.enable = lib.mkIf config.de.gnome.enable true;
  services.xserver.displayManager.gdm.enable = lib.mkIf config.de.gnome.enable true;
  services.xserver.desktopManager.gnome.enable = lib.mkIf config.de.gnome.enable true;
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gnome.gnome-maps
  ]);

  # GreetD and gnome polkit
  systemd.user.services.polkit-gnome-authentication-agent-1 = lib.mkIf config.wm.enable {
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


  environment.systemPackages = lib.mkIf config.gaming.enable [
    (pkgs.lutris.override {
      extraLibraries = pkgs: [
        pkgs.gnome.adwaita-icon-theme
      ];
    })
  ];
}

