{ ... }: {
  # Systemd-networkd
  systemd.network = lib.mkForce {
    enable = true;
    networks = {
      "wlan0" = {
        matchConfig.Name = "wlan0";
        networkConfig.DHCP = "ipv4";
        address = [ "192.168.1.3/24" ];
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
