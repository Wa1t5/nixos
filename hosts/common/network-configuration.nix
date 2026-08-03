{ lib, config, ... }:
{

  networking = {
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

    firewall = {
      enable = true;
      trustedInterfaces = [ config.services.tailscale.interfaceName ];
      allowedUDPPorts = [ config.services.tailscale.port ];
    };
  };

  # Enable systemd-resolved (Disable resolved in case of dnscrypt)
  services.resolved = {
    enable = lib.mkForce true;

  };

  # 3. Optimization: Prevent systemd from waiting for network online
  # (Optional but recommended for faster boot with VPNs)
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;

  # Enable wireshark
  programs.wireshark = {
    enable = false;
  };
}
