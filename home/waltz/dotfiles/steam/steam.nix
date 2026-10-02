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
    #dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    package = pkgs.steam.override {
      extraPkgs =
        pkgs: with pkgs; [

          # Requirements for gamescope xwayland
          #libXcursor
          #libXi
          #libXinerama
          #libpng
          #libvorbis
          #stdenv.cc.cc.lib
          #libkrb5
          #keyutils

          # Mangohud
          mangohud

          # lsfg-vk
          lsfg-vk
        ];
    };
  };

  # Gamescope
  programs.gamescope = lib.mkIf config.gaming.enable {
    enable = true;
    capSysNice = false;
  };

  environment.variables = {
    DXVK_CONFIG = "dxvk.enableGraphicsPipelineLibrary = True; dxvk.maxDeviceMemory = 0; dxvk.numCompilerThreads = 4;";
    MESA_SHADER_CACHE_MAX_SIZE = "10G";
    PROTON_USE_NTSYNC = "1";
    DXVK_HUD = "compiler";
  };

  environment.systemPackages = lib.mkIf config.gaming.enable [
    (pkgs.lutris.override {
      extraLibraries = pkgs: [
        pkgs.adwaita-icon-theme
      ];
    })
  ];
}
