{ lib, ... }:
{
  services.navidrome = {
    enable = true;
    openFirewall = true;
    environmentFile = "/var/lib/secrets/navidrome/navidrome.env";
    settings = {
      Address = "0.0.0.0";

      MusicFolder = "/media/audio";

      Scanner.Extractor = "ffmpeg";

      EnableTranscodingConfig = true;

      # Last FM
      LastFM.Enabled = true;
      EnableSharing = true;

      # UI
      UILoginBackgroundUrl = "https://w.wallhaven.cc/full/pk/wallhaven-pk5z5m.png";
    };
  };

  users.users.navidrome.extraGroups = [ "media" ];

  # Disable home protection to get access to waltz home music folder
  #systemd.services.navidrome.serviceConfig.ProtectHome = lib.mkForce false;
}
