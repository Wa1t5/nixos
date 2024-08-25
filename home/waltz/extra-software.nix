{ pkgs, inputs, lib, config, ... }:
{
  imports = [
    inputs.aagl.nixosModules.default
    ./dotfiles/steam/steam.nix
    ./dotfiles/aagl/aagl.nix
    ./config.nix # Current file is impoted by uplevel options.nix thus needing to import config manually
  ];

  # Dconf (required by hyprland)
  programs.dconf = {
    enable = true;
  };

  # Enable hyprland 2-nd time
  programs.hyprland = lib.mkIf config.wm.hyprland.enable {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    #portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  # GreetD and gnome polkit
  systemd = lib.mkIf config.wm.enable {
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
        pkgs.adwaita-icon-theme
      ];
    })
  ];
}

