{ ... }:
{
  imports = [
    ../common
    ../common/misc
    ./packages.nix
    ./hardware-configuration.nix
  ];


  # Hostname
  networking.hostName = "emperor";
}
