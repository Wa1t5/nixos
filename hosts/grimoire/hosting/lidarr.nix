{ ... }:
{
  services.lidarr = {
    enable = false;
    openFirewall = false;
  };
  #systemd.services.lidarr.serviceConfig.InaccessiblePaths = [ 
  #  "/home/waltz/img" 
  #  "/home/waltz/docs" 
  #  "/home/waltz/desktop"
  #  "/home/waltz/downloads"
  #  "/home/waltz/.config"
  #];
}
