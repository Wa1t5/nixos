{ ... }: {
  services.glance = {
    enable = true;
    openFirewall = true;
    settings = {
      server = {
        host = "0.0.0.0";
        port = 9000;
      };
      pages = [
        {
          name = "Home";
          columns = [
            {
              size = "small";
              widgets = [
                {
                  type = "bookmarks";
                  groups = [
                    {
                      title = "Homelab";
                      links = [
                        {
                          title = "Navidrome";
                          url = "http://navidrome.home";
                          icon = "sh:navidrome";
                        }
                        {
                          title = "Kavita";
                          url = "http://kavita.home";
                          icon = "sh:kavita";
                        }
                        {
                          title = "Jellyfin";
                          url = "http://jellyfin.home";
                          icon = "sh:jellyfin";
                        }
                        {
                          title = "qBittorrent";
                          url = "http://qbittorrent.home";
                          icon = "sh:qbittorrent";
                        }
                        {
                          title = "slskd";
                          url = "http://slskd.home";
                          icon = "sh:slskd";
                        }
                        {
                          title = "Blocky";
                          url = "http://blocky.home";
                          icon = "sh:blocky";
                        }
                        {
                          title = "Scrutiny";
                          url = "http://scrutiny.home";
                          icon = "sh:scrutiny";
                        }
                        {
                          title = "Shoko";
                          url = "http://shoko.home";
                          icon = "sh:shoko";
                        }
                      ];
                    }
                  ];
                }
              ];
            }
            {
              size = "full";
              widgets = [
                {
                  type = "monitor";
                  title = "Services";
                  cache = "1m";
                  sites = [
                    {
                      title = "Navidrome";
                      url = "http://navidrome.home";
                      allow-insecure = true;
                    }
                    {
                      title = "Kavita";
                      url = "http://kavita.home";
                      allow-insecure = true;
                    }
                    {
                      title = "Jellyfin";
                      url = "http://jellyfin.home";
                      allow-insecure = true;
                    }
                    {
                      title = "qBittorrent";
                      url = "http://qbittorrent.home";
                      allow-insecure = true;
                    }
                    {
                      title = "slskd";
                      url = "http://slskd.home";
                      allow-insecure = true;
                    }
                    {
                      title = "Blocky";
                      url = "http://blocky.home";
                      allow-insecure = true;
                    }
                    {
                      title = "Scrutiny";
                      url = "http://scrutiny.home";
                      allow-insecure = true;
                    }
                    {
                      title = "Shoko";
                      url = "http://shoko.home";
                      allow-insecure = true;
                    }
                  ];
                }
              ];
            }
          ];
        }
      ];
    };
  };

  networking.firewall.allowedTCPPorts = [ 9000 ];
}
