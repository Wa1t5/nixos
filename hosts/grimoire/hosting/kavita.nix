{ ... }:
{
  services.kavita = {
    enable = true;
    tokenKeyFile = "/var/lib/secrets/kavita-token";
    settings = {
      IpAddress = "0.0.0.0";
    };
  };

  users.users.kavita.extraGroups = [ "media" ];
  networking.firewall.allowedTCPPorts = [ 5000 ];
}
