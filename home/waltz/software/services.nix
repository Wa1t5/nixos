{ pkgs
, lib
, osConfig
, ...
}:
{
  imports = [
    ../dotfiles/hypridle/hypridle.nix
    ../dotfiles/mako/mako.nix
    ../dotfiles/clipse/clipse.nix
    ../config.nix
    ./servers.nix
  ];

  services = {
    gnome-keyring = lib.mkIf osConfig.wm.enable {
      enable = true;
    };

    # PSD (Profile Sync Daemon)
    psd = lib.mkIf (!osConfig.headless.enable) {
      enable = false;
    };

    # Syncthing
    syncthing = {
      enable = lib.mkIf (osConfig.networking.hostName != "grimoire") true;
    };

    # Dunst
    dunst = lib.mkIf osConfig.wm.enable {
      enable = false;
      settings = import ./dotfiles/dunst/dunst.nix;
    };

    # GPG Agent
    gpg-agent = {
      enable = false;
      enableSshSupport = true;
      enableZshIntegration = true;
      pinentry.package = pkgs.pinentry-qt;
    };

    # Mpd
    mpd = {
      enable = false;
      network = {
        startWhenNeeded = true;
      };
      extraConfig = import ./dotfiles/mpd/config.nix;
      playlistDirectory = "/home/waltz/music/Playlists";
    };

    # Mpd mpris
    mpd-mpris = {
      enable = false;
    };

    # Playerctld
    playerctld = {
      enable = lib.mkIf osConfig.wm.enable true;
    };

    # Easyeffects
    easyeffects = {
      enable = false;
    };
  };
}
