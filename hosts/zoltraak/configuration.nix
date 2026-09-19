{ ... }:
{
  imports = [
    ../common/default.nix
    ./packages.nix
    ./hardware-configuration.nix
    ./hardware-configuration-keep.nix
    ./network-configuration.nix
  ];

  # Hostname
  networking.hostName = "zoltraak";
}
