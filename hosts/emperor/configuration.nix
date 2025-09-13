{ ... }:
{
  imports = [
    ../common
    ../common/misc
    ./packages.nix
    ./hardware-configuration.nix
    ./hardware-configuration-keep.nix
  ];


  # Hostname
  networking.hostName = "emperor";
}
