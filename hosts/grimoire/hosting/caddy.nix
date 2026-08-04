{ ... }:
{
  services.caddy = {
    enable = true;

    virtualHosts = {
      "*.home" = {
        extraConfig = "
	  tls internal

	  @jellyfin host jellyfin.home
	  handle @jellyfin { reverse_proxy 127.0.0.1:8096 }

	  @navidrome host navidrome.home
	  handle @navidrome { reverse_proxy 127.0.0.1:4533 }

	  @kavita host kavita.home
	  handle @kavita { reverse_proxy 127.0.0.1:5000 }
	  
	  @seerr host seerr.home
	  handle @seerr { reverse_proxy 127.0.0.1:5055 }

	  @sonarr host sonarr.home
	  handle @sonarr { reverse_proxy 127.0.0.1:8989 }

	  @prowlarr host prowlarr.home
	  handle @prowlarr { reverse_proxy 127.0.0.1:9696 }

	  @qbittorrent host qbittorrent.home
	  handle @qbittorrent { reverse_proxy 127.0.0.1:8080 }

	  @slskd host slskd.home
	  handle @slskd { reverse_proxy 127.0.0.1:5030 }

	  @grimoire host grimoire.home
	  handle @grimoire { reverse_proxy 127.0.0.1:9000 }

	  @scrutiny host scrutiny.home
	  handle @scrutiny { reverse_proxy 127.0.0.1:8000 }



	  @shoko host shoko.home
	  handle @shoko { reverse_proxy 127.0.0.1:8111 }
";
      };

    };
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  networking.firewall.allowedUDPPorts = [
    80
    443
  ];
}
