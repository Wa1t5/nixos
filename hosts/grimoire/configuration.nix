{ ... }:
{
  imports = [
    ../common/default.nix
    ./packages.nix
    ./ssh.nix
    ./hosting/default.nix
    ./hardware-configuration.nix
    ./media.nix
    ./network-configuration.nix
  ];

  # Hostname
  networking.hostName = "grimoire";
}
