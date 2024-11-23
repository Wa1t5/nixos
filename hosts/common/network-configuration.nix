{ lib, ... }:
{
  # Systemd-networkd
  systemd.network = lib.mkForce {
    enable = true;
    networks = {
      "wlan0" = {
        matchConfig.Name = "wlan0";
        networkConfig.DHCP = "ipv4";
      };
      "wg-soulseek" = {
        matchConfig.Name = "wg-soulseek";
        address = [
          "10.2.0.2/32"
        ];
        DHCP = "no";
        dns = [ "10.2.0.1" ];
        networkConfig = {
          IPv6AcceptRA = false;
        };
      };

    };
  };

  networking = {
    # Uncomment when using dnscrypt
    # nameservers = [ "127.0.0.1" "::1" ];

    # Disable dhcpcd config
    useDHCP = lib.mkForce false;

    # Wireless networks
    wireless = {
      # Wpa supplicant
      enable = lib.mkForce false;

      # iwd
      iwd.enable = lib.mkForce true;
    };

    # Disable NetworkManager
    networkmanager.enable = lib.mkForce false;

    #  Extra host (can be used to block things like ads)
    #extraHosts =
    #  let
    #    hostsPath = "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts";
    #    hostsFile = builtins.fetchurl {
    #      url = "${hostsPath}";
    #      sha256 = "0fjw019603vizz95znvr0022bn6d5bnf4iv6vv41h27g7lyidh3q";
    #    };
    #  in
    #  builtins.readFile "${hostsFile}";
  };

  # Enable systemd-resolved (Disable resolved in case of dnscrypt)
  services.resolved.enable = lib.mkForce true;

  # DNSCrypt
  services.dnscrypt-proxy2 = {
    enable = false;
    settings = {
      # Use ipv6
      ipv6_servers = true;
      ipv4_servers = true;

      # Use only dnscrypt
      dnscrypt_servers = true;
      doh_servers = true;
      odoh_servers = false;

      # Stricter requirements
      require_dnssec = false;
      require_nolog = true;
      require_nofilter = true;

      # Improve privacy
      dnscrypt_ephemeral_keys = true; # Disable on case of high cpu load
      tls_disable_session_tickets = false; # Disable on case of high latency

      # Server list
      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };
    };
  };

  # Systemd service settings
  systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy";
  };

  # Enable wireshark
  programs.wireshark = {
    enable = false;
  };
}
