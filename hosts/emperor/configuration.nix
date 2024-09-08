{ ... }:
{
  imports = [
    ../common
    ../common/misc
    ./packages.nix
    ./hardware-configuration.nix
  ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Hostname
  networking.hostName = "emperor";

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # System locale and console keymap
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

  # Base system version
  system.stateVersion = "24.05";
}
