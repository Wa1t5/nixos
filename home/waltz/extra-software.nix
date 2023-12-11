{ pkgs, ... }:
{
  # Extra packages  
  programs = {
    # Steam
    steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
                
  # Hyprland
  hyprland.enable = true;
  };
}
