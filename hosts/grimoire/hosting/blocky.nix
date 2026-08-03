{ ... }:
{
  services.blocky = {
    enable = true;
    settings = {
      log = {
        level = "error";
        privacy = true;
      };
      caching = {
        minTime = "5m";
        maxTime = "24h";
        prefetching = true;
        prefetchExpires = "2h";
        prefetchThreshold = 5;
      };

      ports = {
        http = 3000;
        freeBind = true;
      };

      bootstrapDns = [
        "127.0.0.1:5335"
      ];

      rebindingProtection.enable = true;

      upstreams = {
        init = {
          strategy = "fast";
        };
        groups = {
          default = [
            "127.0.0.1:5335"
          ];
        };
        strategy = "parallel_best";
      };
      customDNS = {
        mapping = {
          "home" = "192.168.1.4";
        };
      };
      blocking = {
        denylists = {
          ads = [
            "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
            "https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"
            "https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt"
          ];
        };
        clientGroupsBlock = {
          default = [ "ads" ];
        };
        blockType = "nxDomain";
        loading.refreshPeriod = "24h";
      };
    };
  };

  networking.firewall.allowedTCPPorts = [
    3000
    53
  ];
  networking.firewall.allowedUDPPorts = [
    3000
    53
  ];

  systemd.services.blocky = {
    after = [ "unbound.service" ];
    wants = [ "unbound.service" ];
  };
}
