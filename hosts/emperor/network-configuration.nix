{ ... }:
{
  networking = {
    # Enable auto dhcp config
    useDHCP = true;
    interfaces.wlan0.useDHCP = true;

    # Set nameservers and disable resolv.conf
    nameservers = [ "127.0.0.1" "::1" ]; # change to 127.0.0.1 in case of dnscrypt

    # Uncomment in case of using dnscrypt
    dhcpcd.extraConfig = "nohook resolv.conf";
    networkmanager.dns = "none";

    # Wireless networks
    wireless = {
      enable = false; # disable wpa_supplicat
      iwd.enable = true;
    };

    #  Extra host (can be used to block things like ads)
    extraHosts =
      let
        hostsPath = "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts";
        hostsFile = builtins.fetchurl {
          url = "${hostsPath}";
          sha256 = "1kdvji5l43i70zxw6hbb5f8iilswv2iq7zysyvasjvhmv049fxpw";
        };
      in
      builtins.readFile "${hostsFile}";
  };

  # Disable resolved in case of dnscrypt
  services.resolved.enable = true;

  # DNSCrypt
  services.dnscrypt-proxy2 = {
    enable = true;
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
          #"https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/odoh-relays.md"
          #"https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/odoh-servers.md"
          #"https://download.dnscrypt.info/dnscrypt-resolvers/v3/odoh-relays.md"
          #"https://download.dnscrypt.info/dnscrypt-resolvers/v3/odoh-servers.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
        #cache_file = "/var/lib/dnscrypt-proxy2/odoh.md";
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
    enable = true;
  };
}
