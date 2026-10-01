{
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
    gnome-keyring = lib.mkIf osConfig.wm.enable {
      enable = true;
    };

    # PSD (Profile Sync Daemon)
    psd = {
      enable = lib.mkIf (!osConfig.headless.enable) true;
    };

    # Syncthing
    syncthing = {
      enable = lib.mkIf (osConfig.networking.hostName != "grimoire") true;
    };
  };
}
