{ ... }:
{
  services.qbittorrent = {
    enable = true;
    openFirewall = true;
  };

  networking.firewall.allowedTCPPorts = [ 54496 ];
  users.users.qbittorrent.extraGroups = [ "media" ];

  # allow other services to manage files
  systemd.services.qbittorrent.serviceConfig.umask = "0002";
}
