{ pkgs, inputs, lib, config, ... }:
{
  imports = [
    inputs.aagl.nixosModules.default
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
    #xwayland.enable = false;
    #portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    #portalPackage = pkgs.xdg-desktop-portal-wlr;
    #portalPackage = inputs.xdpw.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
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
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time -r --cmd 'Hyprland'";
      };
    };
  };

  # Extra packages  

  # An Anime Game Launcher
  programs.anime-game-launcher.enable = lib.mkIf config.gaming.enable true; # Adds launcher and /etc/hosts rules
  programs.anime-games-launcher.enable = lib.mkIf config.gaming.enable true;
  programs.anime-borb-launcher.enable = lib.mkIf config.gaming.enable true;
  programs.honkers-railway-launcher.enable = lib.mkIf config.gaming.enable true;
  programs.honkers-launcher.enable = lib.mkIf config.gaming.enable true;
  programs.wavey-launcher.enable = lib.mkIf config.gaming.enable true;
  programs.sleepy-launcher.enable = lib.mkIf config.gaming.enable true;

  # Steam
  programs.steam = lib.mkIf config.gaming.enable {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    package = pkgs.steam.override {
      extraPkgs = pkgs:
        with pkgs; [

          # Requirements for gamescope xwayland
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          libpng
          libvorbis
          stdenv.cc.cc.lib
          libkrb5
          keyutils

          # Mangohud
          mangohud

          # Usage 'gamescope -f -- %command% & sleep 2 && renice -n -11 -p $(pgrep gamescope)'
          (writeShellScriptBin "launch-gamescope" ''
            (sleep 1;  pgrep gamescope | xargs renice -n -11 -p)&
            exec gamescope "$@"
          '')
        ];
    };
  };

  # Gamescope
  programs.gamescope = lib.mkIf config.gaming.enable {
    enable = true;
    env.XKB_LAYOUT = "br";
  };

  environment.systemPackages = lib.mkIf config.gaming.enable [
    (pkgs.lutris.override {
      extraLibraries = pkgs: [
        pkgs.adwaita-icon-theme
      ];
    })
  ];
}

