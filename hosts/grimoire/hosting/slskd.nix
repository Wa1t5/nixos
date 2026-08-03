{ ... }:
{
  services.slskd = {
    enable = true;
    openFirewall = true;
    environmentFile = "/var/lib/secrets/slskd-environment";
    settings = {
      directories = {
        incomplete = "/media/downloads/soulseek/incomplete";
        downloads = "/media/downloads/soulseek/complete";
      };

      shares = {
        directories = [ "/media/audio" ];
      };
      soulseek = {
        listen_port = 2234;
      };
    };
  };

  networking.firewall.allowedTCPPorts = [
    5030
    2234
  ];

  users.users.slskd.extraGroups = [ "media" ];

  # allow other services to manage files
  systemd.services.slskd.serviceConfig.UMask = "0002";
}
