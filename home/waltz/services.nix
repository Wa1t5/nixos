{ pkgs, lib, config, ... }:
{
  imports = [
    ./dotfiles/hypridle/hypridle.nix
    ./config.nix
  ];

  services = {
    # Syncthing
    syncthing = {
      enable = true;
    };

    # Dunst
    dunst = lib.mkIf config.wm.enable {
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
      enable = false; # Reenable after they fix deepfilternet
    };
  };
}
