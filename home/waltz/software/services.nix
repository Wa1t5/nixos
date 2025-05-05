{ pkgs, lib, config, ... }: {
  imports = [
    ../dotfiles/hypridle/hypridle.nix
    ../dotfiles/mako/mako.nix
    ../config.nix
    ./servers.nix
  ];


  services = {

    # PSD (Profile Sync Daemon)
    psd = {
      enable = true;
    };

    # Syncthing
    syncthing = { enable = true; };

    # Dunst
    dunst = lib.mkIf config.wm.enable {
      enable = false;
      settings = import ./dotfiles/dunst/dunst.nix;
    };

    # GPG Agent
    gpg-agent = {
      enable = false;
      enableSshSupport = true;
      enableZshIntegration = true;
      pinentryPackage = pkgs.pinentry-qt;
    };

    # Mpd
    mpd = {
      enable = false;
      network = { startWhenNeeded = true; };
      extraConfig = import ./dotfiles/mpd/config.nix;
      playlistDirectory = "/home/waltz/music/Playlists";
    };

    # Mpd mpris
    mpd-mpris = { enable = false; };

    # Playerctld
    playerctld = { enable = lib.mkIf config.wm.enable true; };

    # Easyeffects
    easyeffects = { enable = true; };
  };
}
