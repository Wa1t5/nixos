{ ... }:
{
  networking.nftables.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 
      # Syncthing
      8384 22000 

      # Localsend
      53317
    ];
    allowedUDPPorts = [ 
      # Syncthing
      22000 21027 
    ];
  };
}
