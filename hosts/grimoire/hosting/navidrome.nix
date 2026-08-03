{ lib, ... }:
{
  services.navidrome = {
    enable = true;
    openFirewall = true;
    settings = {
      Address = "0.0.0.0";

      MusicFolder = "/media/audio";

      Scanner.Extractor = "ffmpeg";

      EnableTranscodingConfig = true;

      # Last FM
      LastFM.Enabled = true;
      #LastFM.ApiKey = "75c9cffe6451047319f00ea5d92aa81f";
      #LastFM.Secret = "16ee318198d80649ab4775afdd7e0efa";
      #EnableSharing = true;

      # Group albums by artist
      #Scanner.GroupAlbumReleases = true;
      #SubsonicArtistParticipations = true;

      # Spotify
      #Spotify.ID = "22a993a5266b438a9e7b0732d04085d7";
      #Spotify.Secret = "8f2beeec39f64fe6bbc63598110437ad";

      # UI
      UILoginBackgroundUrl = "https://w.wallhaven.cc/full/pk/wallhaven-pk5z5m.png";
    };
  };

  users.users.navidrome.extraGroups = [ "media" ];

  # Disable home protection to get access to waltz home music folder
  #systemd.services.navidrome.serviceConfig.ProtectHome = lib.mkForce false;
}
