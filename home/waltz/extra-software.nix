{  services, pkgs, inputs, ... }:
{
  # Extra packages  
  programs = {
    # Dconf (required by hyprland)
    dconf = {
      enable = true;
    };

    # Enable hyprland 2-nd time
    #hyprland = {
    #   enable = true;
    #   package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    #   #portalPackage = inputs.xdpw.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    #};


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
