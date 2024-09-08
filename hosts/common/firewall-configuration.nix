{ ... }:
{
  # Loose reverse path checking so wireguard works
  networking.firewall.checkReversePath = "loose";

  # Use more modern firewall kernel interface
  networking.nftables.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      # Syncthing
      8384
      22000

      # Navidrome
      4533
    ];
    allowedUDPPorts = [
      # Syncthing
      22000
      21027
    ];
  };
}
