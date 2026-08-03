{ ... }: {
  users.groups.media = { };

  systemd.tmpfiles.rules = [
    "d /media 2775 root media -"
    "d /media/audio 2775 root media -"
    "d /media/video 2775 root media -"
    "d /media/video/anime 2775 root media -"
    "d /media/video/series 2775 root media -"
    "d /media/video/movies 2775 root media -"
    "d /media/books 2775 root media -"
    "d /media/downloads 2775 root media -"
    "d /media/downloads/soulseek 2775 root media -"
    "d /media/downloads/soulseek/incomplete 2775 root media -"
    "d /media/downloads/soulseek/complete 2775 root media -"
    "d /media/downloads/qbittorrent 2775 root media -"
    "d /media/downloads/qbittorrent/incomplete 2775 root media -"
    "d /media/downloads/qbittorrent/complete 2775 root media -"
    "d /media/beets 2775 root media -"
  ];
}
