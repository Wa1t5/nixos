{
  config,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    beets
    chromaprint
    rsgain
    ffmpeg
  ];

  users.users.beets = {
    isSystemUser = true;
    group = "beets";
  };

  users.groups.beets = { };

  environment.etc."beets/config.yaml".text = ''
    directory: /media/audio
    library: /media/beets/library.db

    import:
      move: yes
      copy: no
      write: yes
      incremental: no
      timid: no
      quiet: yes
      quiet_fallback: asis
      duplicate_action: merge

    paths:
      default: $albumartist/$album/$track - $title
      singleton: Singles/$artist/$title

    plugins:
      - fetchart
      - embedart
      - scrub
      - duplicates
      - chroma
      #- replaygain
      - lastgenre
      - badfiles
      - musicbrainz
      - duplicates
      - lyrics

    match:
      strong_rec_thresh: 0.30

    fetchart:
      auto: yes

    scrub:
      auto: yes

    embedart:
      auto: yes

    chroma:
      auto: yes

    replaygain:
      auto: yes

    lastgenre:
      auto: yes
      count: 5
      source: track

    lyrics:
      auto: yes
      sources: [lrclib, lrcmux ] 
      synced: yes

    ignore:
      .DS_Store: yes
      Thumbs.db: yes
  '';

  systemd.services.beets-import = {
    description = "Import music with beets";

    serviceConfig = {
      Type = "oneshot";
      User = "beets";
      Group = "beets";
      Environment = "BEETSDIR=/media/beets";
      ExecStart = [
        "${pkgs.beets}/bin/beet -c /etc/beets/config.yaml update"
        "${pkgs.beets}/bin/beet -c /etc/beets/config.yaml import /media/downloads/soulseek/complete"
      ];
    };
  };

  #systemd.timers.beets-import = {
  #  wantedBy = [ "timers.target" ];

  #  timerConfig = {
  #    OnBootSec = "5min";
  #    OnUnitActiveSec = "30min";
  #  };
  #};

  users.users.beets.extraGroups = [ "media" ];

  # allow other services to manage files
  systemd.services.beets.serviceConfig.umask = "0002";
}
