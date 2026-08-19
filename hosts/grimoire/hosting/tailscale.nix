{ ... }:
{
  services.tailscale = {
    enable = true;
    openFirewall = true;
    extraUpFlags = [
      "--accept-routes"
      "-ssh"
      "--advertise-routes=192.168.1.0/24"
      "--advertise-exit-node"
      "--ssh"
    ];
    useRoutingFeatures = "both";
  };

  # 2. Force tailscaled to use nftables (Critical for clean nftables-only systems)
  # This avoids the "iptables-compat" translation layer issues.
  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];

}
