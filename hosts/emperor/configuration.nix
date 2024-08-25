{ inputs, ... }:
{
  imports =
    [
      # Hardware config
      ./hardware-configuration.nix

      # Tablet config
      ../common/tablet-configuration.nix

      # Kernel configuration
      ../common/kernel-configuration.nix

      # Network config
      ../common/network-configuration.nix

      # Graphics config
      ../common/graphics-configuration.nix

      # Firewall
      ../common/firewall-configuration.nix

      # Security
      ../common/security-configuration.nix

      # Packages
      ./packages.nix

      # Boot
      ../common/boot-configuration.nix

      # Session Management
      ../common/session-manager-configuration.nix

      # Audio
      ../common/audio-configuration.nix

      # Misc
      ./misc/misc.nix

      # Users
      ../common/users.nix

      # Realtime
      ../common/realtime-group.nix

      # Virtualisation
      ../common/virtualisation.nix
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
  system.stateVersion = "24.11";
}
