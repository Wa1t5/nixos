{ ... }: {
  services.scrutiny = {
    enable = true;
    openFirewall = true;
    settings.web.listen.port = 8000;
    collector.enable = true;
  };

  networking.firewall.allowedTCPPorts = [ 8000 ];
}
