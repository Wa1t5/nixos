{ ... }:
{
  networking.nftables.enable = true;
  networking.firewall = {
    enable = true;

    # Syncthing ports: 8384 for remote access to GUI
    # 22000 TCP and/or UDP for sync traffic
    # 21027/UDP for discovery
    # source: https://docs.syncthing.net/users/firewall.html
    allowedTCPPorts = [ 8384 22000 ];
    allowedUDPPorts = [ 22000 21027 ];
  };
}
