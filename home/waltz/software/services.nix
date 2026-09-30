{
  pkgs,
  lib,
  osConfig,
  ...
}:
{
  imports = [
    ../config.nix
    ./servers.nix
  ];

  services = {
    #gnome-keyring = lib.mkIf osConfig.wm.enable {
    #  enable = true;
    #};

    # PSD (Profile Sync Daemon)
    #psd = lib.mkIf (!osConfig.headless.enable) {
    #  enable = false;
    #};

    # Syncthing
    syncthing = {
      enable = lib.mkIf (osConfig.networking.hostName != "grimoire") true;
    };
  };
}
