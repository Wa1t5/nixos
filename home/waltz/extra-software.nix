{ pkgs, inputs, ... }:
{
  imports = [
    inputs.aagl.nixosModules.default
  ];

  # Extra packages  
  programs = {
    # Dconf (required by hyprland)
    dconf = {
      enable = true;
    };

    # Enable hyprland 2-nd time
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      #xwayland.enable = false;
      #portalPackage = (pkgs.xdg-desktop-portal-hyprland.overrideAttrs { version = "1.3.0"; });
      portalPackage = pkgs.xdg-desktop-portal-wlr;
    };

    # An Anime Game Launcher
    anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
    anime-games-launcher.enable = true;
    anime-borb-launcher.enable = true;
    honkers-railway-launcher.enable = true;
    honkers-launcher.enable = true;
    wavey-launcher.enable = true;
    sleepy-launcher.enable = true;

    # Steam
    steam = {
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
    gamescope = {
      enable = true;
      env.XKB_LAYOUT = "br";
    };

    # Noisetorch 
    noisetorch = {
      enable = true;
    };

  };
}
