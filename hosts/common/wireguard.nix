{
  config,
  sops,
  pkgs,
  ...
}:
{
  # Load private keys
  sops = {
    secrets."wg_soulseek_private_key" = {
      sopsFile = "/etc/nixos/secrets/wireguard-private-keys.yaml";
      format = "yaml";
      owner = "systemd-network";
    };
  };

  systemd.network = {
    netdevs = {
      "wg-soulseek" = {
        netdevConfig = {
          Kind = "wireguard";
          Name = "wg-soulseek";
          MTUBytes = "1300";
        };
        wireguardConfig = {
          PrivateKeyFile = config.sops.secrets."wg_soulseek_private_key".path;
          ListenPort = 9918;
        };
        wireguardPeers = [
          # configuration for nixos 24.05
          {
            PublicKey = "agoivyLoPqor8MxA/s6UWJSMcA2pMl+ajO3vy/q3oWQ=";
            AllowedIPs = [
              "0.0.0.0/0"
              "::0"
            ];
            Endpoint = "103.125.235.18:51820";
            RouteTable = 51820;
          }
        ];
      };
    };
  };
}
