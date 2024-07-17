{ ... }:
{
   networking = {
        # Enable auto dhcp config
        useDHCP = true;
        interfaces.wlan0.useDHCP = true;

        # Set nameservers and disable resolv.conf
        nameservers = [ "1.1.1.1" ]; # change to 127.0.0.1 in case of dnscrypt
        
	# Uncomment in case of using dnscrypt
	# dhcpcd.extraConfig = "nohook resolv.conf";
	# networkmanager.dns = "none";

        # Wireless networks
        wireless = {
            enable = false; # disable wpa_supplicat
	    iwd.enable = true;
        };

	# Extra host (can be used to block things like ads)
        #extraHosts = let
        #  hostsPath = https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts;
        #  hostsFile = builtins.fetchurl { 
	#    url = "${hostsPath}";
	#    sha256 = "0079x21cijk9q8zpi9isfwzn06mbxd8xd7di79ap6pnnsmbg9z5n";
	#  };
	#in builtins.readFile "${hostsFile}";
    };

    # Disable resolved in case of dnscrypt
    services.resolved.enable = true;

    # DNSCrypt
    services.dnscrypt-proxy2 = {
    enable = false;
    settings = {
      # Use ipv4
      ipv6_servers = false;
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
}
