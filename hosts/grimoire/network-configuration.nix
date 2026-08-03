{ lib, ... }: {

  # Disable because we're already running a dns server
  services.resolved.settings = lib.mkForce {
    Resolve = {
      DNSStubListener = "no";
      DNSSEC = "no";
    };
  };

  # Use our own dns to resolve
  networking.nameservers = [
    "127.0.0.1"
    "::1"
  ];

  # Systemd-networkd
  systemd.network = lib.mkForce {
    enable = true;
    networks = {
      "wlan0" = {
        matchConfig.Name = "wlan0";
        address = [
          "192.168.1.4/24"
          "fdf4:c2ca:d1a5::4/64"
        ];
        gateway = [ "192.168.1.1" ];

        networkConfig = {
          IPv6AcceptRA = true;
          DHCP = "ipv6";
          DNS = [ "1.1.1.1" ];
          IPv6PrivacyExtensions = "kernel";
        };
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
}
