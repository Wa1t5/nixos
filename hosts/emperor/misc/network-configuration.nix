{ config, libs, ...  }:
{
    networking = {
        # Enable auto dhcp config
        useDHCP = true;
        interfaces.wlp1s0.useDHCP = true;

        # Set nameservers and disable resolv.conf
        nameservers = [ "1.1.1.1" ];
        dhcpcd.extraConfig = "nohook resolv.conf";

        # Wireless networks
        wireless = {
            enable = true;
            networks = {
                "SO JESUS" = {
                  pskRaw = "fbed1bf8aafb9da805a70449bd03a8f790b7d4cfbb7b0d903d2f5b120cbf0f59";
                };

                "?" = {
                  pskRaw = "8c8fffd8b9118c2136ed28051b996d71ef5168e097f2a77920e9ae9831204dcf";
                };
            };
        };
    };

    # DNSCrypt
    services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      ipv6_servers = true;
      require_dnssec = true;

      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };

      # https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
      server_names = [ "sdns://AgMAAAAAAAAACzE5NC4yNDIuMi40ABRiYXNlLmRucy5tdWxsdmFkLm5ldAovZG5zLXF1ZXJ5" ];
    };
  };
  systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy";
  };

}
