{ ... }:
{
  # Use more modern firewall kernel interface
  networking.nftables.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      # Syncthing
      8384
      22000

      # I2pd
      7070
      7656
      4447
      4444
    ];
    allowedUDPPorts = [
      # Syncthing
      22000
      21027
    ];
  };
}
