{
  lib,
  pkgs,
  config,
  ...
}:
{
  # Steam
  programs.steam = lib.mkIf config.gaming.enable {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    package = pkgs.steam.override {
      extraPkgs =
        pkgs: with pkgs; [

          # Requirements for gamescope xwayland
          libXcursor
          libXi
          libXinerama
          libpng
          libvorbis
          stdenv.cc.cc.lib
          libkrb5
          keyutils

          # Mangohud
          mangohud

          # lsfg-vk
          lsfg-vk

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
