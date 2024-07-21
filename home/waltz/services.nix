{ pkgs, ... }:
{
  imports = [
    ./dotfiles/hypridle/hypridle.nix
  ];

  services = {
    # Syncthing
    syncthing = {
      enable = true;
    };

    # Dunst
    dunst = {
      enable = true;
      settings = import ./dotfiles/dunst/dunst.nix;
    };

    # GPG Agent
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      enableZshIntegration = true;
      pinentryPackage = pkgs.pinentry-qt;
    };

    # OpenSnitch
    opensnitch-ui = {
      enable = true;
    };

    # Mpd
    mpd = {
      enable = true;
      network = { startWhenNeeded = true; };
      extraConfig = import ./dotfiles/mpd/config.nix;
      playlistDirectory = "/home/waltz/music/Playlists";
    };

    # Mpd mpris
    mpd-mpris = {
      enable = true;
    };

    # Playerctld
    playerctld = {
      enable = true;
    };

    # Easyeffects
    easyeffects = {
      enable = true;
    };
  };
}
