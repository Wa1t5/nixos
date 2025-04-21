{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Torrent
    qbittorrent

    # Sync
    syncthing

  ];
}
