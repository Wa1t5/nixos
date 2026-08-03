{ ... }:
{
  services.qbittorrent = {
    enable = true;
    openFirewall = true;
  };

  networking.firewall.allowedTCPPorts = [ 54496 ];
  users.users.qbittorrent.extraGroups = [ "media" ];
}
