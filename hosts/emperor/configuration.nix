{ inputs, ... }:
{
  imports =
    [
      # Hardware config
      ./hardware-configuration.nix

      # Tablet config
      ./tablet-configuration.nix

      # Kernel configuration
      ./kernel-configuration.nix

      # Network config
      ./network-configuration.nix

      # Graphics config
      ./graphics-configuration.nix

      # Firewall
      ./firewall-configuration.nix

      # Security
      ./security-configuration.nix

      # Packages
      ./packages.nix

      # XDG
      # ./xdg-configuration.nix

      # Boot
      ./boot-configuration.nix

      # Session Management
      ./session-manager-configuration.nix

      # Audio
      ./audio-configuration.nix

      # Misc
      ./misc/misc.nix

      # Users
      ./users.nix

      # Realtime
      ./realtime-group.nix

      # Virtualisation
      ./virtualisation.nix
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
